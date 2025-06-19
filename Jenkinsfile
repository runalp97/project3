pipeline {
    agent any


    environment {
    TF_IN_AUTOMATION = 'true'
  }


    stages {
        stage('Checkout') {
      steps {
        git 'https://github.com/<your-username>/sample-web-app.git'
      }
    }

    
    stage('Terraform Init & Apply') {
      steps {
        dir('terraform') {
          sh '''
            terraform init
            terraform plan
            terraform apply -auto-approve
          '''
        }
      }
    }
 
