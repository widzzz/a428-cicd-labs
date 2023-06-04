node {
    docker.image('node:16-buster-slim').withRun('-p 3000:3000') {
        stage('Build') {
            echo 'Running npm install'
            sh 'npm install'
        }
        
        stage('Test') {
            echo 'Running test.sh'
            sh './jenkins/scripts/test.sh'
        }
    }
}
