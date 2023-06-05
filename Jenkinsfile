node {
    docker.image('node:16-buster-slim').withRun('-u root -p 3000:3000') {
        stage('Setup') {
            sh 'apt-get update && apt-get install -y curl'
            sh 'curl -sL https://deb.nodesource.com/setup_16.x | bash -'
            sh 'apt-get install -y nodejs'
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
