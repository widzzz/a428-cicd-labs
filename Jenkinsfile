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
            agent {
                docker {
                    image 'ubuntu:latest'
                }
            }
            steps {
                // Use expect to SSH into the server
                sh '#!/usr/bin/expect'
                sh 'set timeout 10'
                sh 'spawn ssh widzzz@103.176.79.100'
                sh 'expect "password:"'
                sh 'send "carikanD4\n"'
                sh 'expect "~$"'

                // Run the pwd command
                send "pwd\n"

                // Exit the expect script
                expect eof
            }
        }
    }
}
