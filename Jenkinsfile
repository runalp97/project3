pipeline {
  agent any

  environment {
  TF_IN_AUTOMATION = 'true'
  AWS_ACCESS_KEY_ID = 'AKIARZDBHO2NRETAQRMY'
  AWS_SECRET_ACCESS_KEY = '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'
}


  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/runalp97/project3.git'
      }
    }

    stage('Terraform Init & Apply') {
      steps {
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
