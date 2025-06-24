pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = 'true'
    }

    parameters {
        booleanParam(name: 'RUN_DESTROY', defaultValue: false, description: 'Check to destroy infra after install')
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
                            sh '''
                terraform init
                terraform plan
                terraform apply -auto-approve
              '''
                        }
                    }
                }
            }
        }

        stage('Ansible Install') {
            steps {
                sh '''
          ansible-playbook -i ansible/hosts.ini ansible/install.yml
        '''
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

