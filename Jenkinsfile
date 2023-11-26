pipeline{
    agent any
    stages{
        stage ('git checkout:Git'){
            steps{
                script{
                    sh "git branch: 'main', url: 'https://github.com/saikumarpinisetti3/demo-counter-app.git'"
                }

            }
        }
    }
}
