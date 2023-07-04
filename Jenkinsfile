pipeline{
    agent any
    stages{
        stage('git checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/saikumarpinisetti3/demo-counter-app.git'
            }
        }
        stage('unit testing'){
            steps{
                sh 'mvn test'
            }
        }
        stage('Maven build'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('static code analysis'){
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'authentic') {
                    sh 'mvn clean package sonar:sonar'
                }
                }
            }
        }
    }
}
