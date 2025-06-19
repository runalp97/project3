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
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: 'aws-jenkins-creds'
        ]]) {
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
}
