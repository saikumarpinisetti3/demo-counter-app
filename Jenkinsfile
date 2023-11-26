pipeline {
    agent any // This pipeline can run on any available agent

    stages {
        stage('git checkout:Git') { // Stage named "git checkout:Git"
            steps {
                git branch: 'main', url: 'https://github.com/saikumarpinisetti3/demo-counter-app.git'
                // Git step to checkout the 'main' branch from the specified GitHub repository
            }
        }
         stage('maven build'){
                script{
                    sh "mvn clean install"
                }
        }
    }
}
