pipeline {
    agent none
    stages {
        stage() {
            agent {
                docker {
                    image 'node:lts-buster-slim'
                    args '-p 3000:3000'
                }
            }
            stages {
                stage('Build') {
                    steps {
                        sh 'npm install'
                    }
                }
                stage('Test') {
                    steps {
                        sh './jenkins/scripts/test.sh'
                    }
                }
            }
            
        }
        stage('Manual Approval') {
            steps {
                input message: 'Lanjutkan ke tahap Deploy?'
            }
        }
        stage('Deploy') {
            // I add the node in Jenkins
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
                        sh 'docker run -d -p 3000:3000 react-app'
                        sleep time: 1, unit: 'MINUTES'
                    }
                }
            }
        }
    }
}