pipeline {
    agent any
    
    stages{
        stage("Code"){
            steps{
                git url: "https://github.com/vinaybv77716/DIATOZ.git", branch: "main"
            }
        }
        stage("Build & Test"){
            steps{
                sh "docker build . -t bvvinay/diatoz:latest"
            }
        }
        stage("Push to DockerHub"){
            steps{
               sh "docker login -u bvvinay -p Bvv@22188"
                sh "docker push bvvinay/diatoz:latest"
            }
        }
        stage("Deploy"){
            steps{
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
