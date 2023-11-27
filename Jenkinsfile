pipeline {
    agent any // This pipeline can run on any available agent

    stages {
        stage('git checkout:Git') { // Stage named "git checkout:Git"
            steps {
                git branch: 'main', url: 'https://github.com/saikumarpinisetti3/demo-counter-app.git'
                // Git step to checkout the 'main' branch from the specified GitHub repository
            }
        }

        stage('maven build') {
            steps {
                script {
                    sh "mvn clean install"
                }
            }
        }

        stage('unit testing') {
            steps {
                script {
                    sh "mvn test"
                }
            }
        }

        stage('functional testing') {
            steps {
                script {
                    sh "mvn verify"
                }
            }
        }

        stage('static code analysis') {
    steps {
        script {
            withSonarQubeEnv('sonarapi') {
                sh "mvn sonar:sonar"
                // Assuming 'sonar:sonar' is the Maven goal for SonarQube analysis
            }
                waitForQualityGate abortPipeline: false, credentialsId: 'sonar-api'
        }
    }
    }
        stage('docker image build'){
            steps{
                script{
                    sh "sudo su -"
                    sh "docker build -t frontcalc:v1 ."
                    sh "docker image tag frontcalc:v1 saikumarpinisetti/frontcalc:latest"
                }
            }
        }

    }
}
