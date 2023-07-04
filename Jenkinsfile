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
                    withSonarQubeEnv(credentialsId: 'sonartoken') {
                    sh 'mvn clean package sonar:sonar'
                }
                }
            }
        }
        stage('Quality gate status'){
            steps{
                script{
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonartoken'
                }
            }
        }
        stage('upload war file to nexus')
            steps{
                script{
                    nexusArtifactUploader artifacts: [[artifactId: 'springboot', classifier: '', file: 'target/Uber.jar', type: 'jar']], credentialsId: 'nexus-repo', groupId: 'com.example', nexusUrl: '43.204.149.242:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'demoapp-release', version: '1.0.0'
                }
            }
    }
}
