pipeline {
    // SSH connection details for the remote VPS
    // def remote = [:]
    // remote.name = 'test'
    // remote.host = 'test.domain.com'
    // remote.user = 'root'
    // remote.password = 'password'
    // remote.allowAnyHosts = true
    
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
        stage('Manual Approval') {
            steps {
                input message: 'Lanjutkan ke tahap Deploy?'
            }
        }
        stage('Deploy') {
            steps {
                sh 'sshpass -p 'carikanD4' ssh widzzz@103.176.79.100'
            }
        }
    }
}
