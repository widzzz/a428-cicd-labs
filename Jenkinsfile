node {
    docker.image('node:16-buster-slim').inside {
        stage('Setup') {
            sh 'npm --version' // Verify npm installation
        }
        stage('Build') {
            sh 'npm install'
        }
        stage('Test') {
            sh './jenkins/scripts/test.sh'
        }
    }
}
