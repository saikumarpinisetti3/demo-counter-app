pipeline {
    agent any
    stages {
        stage('git checkout:Git') {
            steps {
                script {
                    // Correct syntax for git checkout
                    sh "git checkout -b main origin/main"
                }
            }
        }
    }
}
