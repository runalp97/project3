pipeline {
    agent any

    parameters {
        booleanParam(name: 'RUN_DESTROY', defaultValue: false, description: 'Check to destroy infra after install')
    }

    environment {
        TF_IN_AUTOMATION = 'true'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/runalp97/project3.git'
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                script {
                    def awsCreds = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_credentials']]
                    withCredentials(awsCreds) {
                        dir('terrafiles') {
                            sh 'terraform init'
                            sh 'terraform plan'
                            sh 'terraform apply -auto-approve'
                        }
                    }

                    // Capture EC2 IP **after** Terraform apply
                    env.EC2_PUBLIC_IP = sh(
                        script: 'cd terrafiles && terraform output -raw instance_public_ip',
                        returnStdout: true
                    ).trim()
                    
                    // Verify IP was captured
                    echo "Captured EC2 Public IP: ${env.EC2_PUBLIC_IP}"
                }
            }
        }

        stage('Ansible Install') {
    steps {
        withCredentials([file(credentialsId: 'ec2-ssh-key', variable: 'PEM_FILE')]) {
            script {
                def ip = env.EC2_PUBLIC_IP
                sh """#!/bin/bash
                    chmod 600 \$PEM_FILE

                    ansible-playbook \
                      -i '${ip},' \
                      -u ec2-user \
                      --private-key \$PEM_FILE \
                      --ssh-extra-args "-o StrictHostKeyChecking=no" \
                      -b --become-method=sudo \
                      ansible/install.yml
                """
            }
        }
    }
}

        stage('Terraform Destroy') {
            when {
                expression { params.RUN_DESTROY == true }
            }
            steps {
                script {
                    def awsCreds = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_credentials']]
                    withCredentials(awsCreds) {
                        dir('terrafiles') {
                            sh 'terraform destroy -auto-approve'
                        }
                    }
                }
            }
        }
    }
}
