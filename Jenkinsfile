node {
    docker.image('node:16-buster-slim').withRun('-p 3000:3000') {
        stage('Setup') {
            script {
                sh 'apt-get update && apt-get install -y curl'
                sh 'curl -sL https://deb.nodesource.com/setup_16.x | bash -'
                sh 'apt-get install -y nodejs'
                sh 'npm --version' // Verify npm installation
            }
        }
        stage('Build') {
            script {
                sh 'npm install'
            }
        }
        stage('Test') {
            script {
                sh './jenkins/scripts/test.sh'
            }
        }
    }
}
