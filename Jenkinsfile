pipeline {
  agent any
  tools {
    dockerTool 'docker-27.4.0'
  }
  stages{
    stage('Clone Repository') {
     steps{
      git 'https://github.com/xridhar/angular-jenkins-demo'
     }
    }

    stage('Build Docker Image') {
      steps{
        script {
          sh '/usr/local/bin/docker build -t angular-jenkins-demo .'
        }
      }
    }

    stage('Run Docker Container') {
      steps{
        script {
           sh '/usr/local/bin/docker run -p 8081:80 angular-jenkins-demo'
        }
      }
    }
  }
}
