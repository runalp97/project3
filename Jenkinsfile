pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo '[Build] Starting build process...'
                sh '''
                    mkdir -p build
                    echo "App compiled successfully on $(date)" > build/build_log.txt
                '''
            }
        }

        stage('Test') {
            steps {
                echo '[Test] Running tests...'
                sh '''
                    mkdir -p test
                    echo "All tests passed on $(date)" > test/test_results.txt
                '''
            }
        }

        stage('Package') {
            steps {
                echo '[Package] Packaging application...'
                sh '''
                    mkdir -p output
                    zip -r output/artifacts.zip build/ test/ > /dev/null || echo "No files to zip"
                    echo "Packaging complete on $(date)" >> output/package_log.txt
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo '[Deploy] Simulating deployment...'
                sh '''
                    mkdir -p deploy
                    echo "Deployed app to fake server on $(date)" > deploy/deploy_log.txt
                '''
            }
        }
    }

    post {
        always {
            echo '📋 Pipeline execution complete.'
            sh 'ls -R'
        }
    }
}
