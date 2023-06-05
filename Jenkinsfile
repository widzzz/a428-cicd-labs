node {
    docker.image('node:16-buster-slim').withRun('-p 3000:3000') {
        stage('Build') {
            // Run build commands inside the container
            sh 'npm install'
        }
        stage('Test') {
            // Run test commands inside the container
            sh './jenkins/scripts/test.sh'
        }
    }
}
