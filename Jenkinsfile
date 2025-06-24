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
                    def awsCreds = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: '3738348f-0ac5-4792-8e4b-1f39be529b69']]
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
                }
            }
        }

        stage('Ansible Install') {
            steps {
                withCredentials([file(credentialsId: 'ec2-ssh-key', variable: 'PEM_FILE')]) {
                    script {
                        sh """
                            ansible-playbook \
                            -i "${env.EC2_PUBLIC_IP}," \
                            -u ec2-user \
                            --private-key $PEM_FILE \
                            --ssh-extra-args "-o StrictHostKeyChecking=no"
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
                    def awsCreds = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: '3738348f-0ac5-4792-8e4b-1f39be529b69']]
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

