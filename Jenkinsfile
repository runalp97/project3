pipeline {
  agent any

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
          def awsCreds = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-jenkins-creds']]
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

    stage('Terraform Destroy') {
      steps {
        script {
          def awsCreds = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-jenkins-creds']]
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
