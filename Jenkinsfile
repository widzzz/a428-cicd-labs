pipeline {
    agent none
    stages {
        stage('Build and Test') {
            agent {
                docker {
                    image 'node:lts-buster-slim'
                    args '-p 3000:3000'
                }
            }
            steps {
                sh 'npm install'
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Manual Approval') {
            steps {
                input message: 'Lanjutkan ke tahap Deploy?'
            }
        }
        stage('Deploy') {
            agent { label 'built-in' }
            steps {
                sh "whoami"
                sh "ssh widzzz@103.176.79.100 'pwd'"
            }
        }
    }
}
