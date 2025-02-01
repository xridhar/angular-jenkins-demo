pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "angular-nginx-app"
        CONTAINER_NAME = "angular-nginx-container"
        PORT = "8081"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/xridhar/angular-jenkins-demo.git'  // Update with your repo URL
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }

        stage('Build Angular App') {
            steps {
                script {
                    sh 'npm run build --prod'
                }
            }
        }

        stage('Create Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker stop $CONTAINER_NAME || true && docker rm $CONTAINER_NAME || true"
                    sh "docker run -d --name $CONTAINER_NAME -p $PORT:80 $DOCKER_IMAGE"
                }
            }
        }
    }
}
