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
            agent { label 'dicoding-practice' }
            steps {
                sh 'pwd'
                script {
                    try {
                        sh 'docker rm $(docker ps -a -q)'
                    } catch (Exception e) {
                        echo "Failed to remove Docker containers: ${e.getMessage()}"
                    } finally {
                        sh 'docker build -t react-app .'
                        sh 'docker run -it -v /opt/jenkins/workspace/:/usr/app react-app'
                        sleep time: 1, unit: 'MINUTES'
                    }
                }
            }
        }
    }
}