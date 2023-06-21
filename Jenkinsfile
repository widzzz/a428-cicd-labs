pipeline {
    agent none
    stages {
        stage('Local pipeline') {
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
                        try {
                            sh 'docker stop $(docker ps -q)'
                        } catch (Exception e) {
                            echo "Failed to stop Docker containers: ${e.getMessage()}"
                        } finally {
                            sh 'docker rm $(docker ps -a -q)'
                        }
                    } catch (Exception e) {
                        echo "Failed to remove Docker containers: ${e.getMessage()}"
                    } finally {
                        sh 'docker build -t react-app .'
                        sh 'docker run -d --network=mynet --ip="10.0.0.2" -p 3000:3000 react-app'
                        sh 'docker build -t my-reverse-proxy ./nginx'
                        sh 'cd nginx; docker run -d --network=mynet -p 80:80 my-reverse-proxy'
                        sleep time: 1, unit: 'MINUTES'
                    }
                }
            }
        }
    }
}