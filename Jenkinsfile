pipeline {
    agent any

    tools {
        maven 'Maven 3.8.1'
    }

    environment {
        // ACTION: Replace this with your Docker Hub username
        DOCKER_IMAGE = "nave00/spring-petclinic:${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                // ACTION: Replace this with your forked repo URL if you forked it
                // If you didn't fork it, you can leave this as is for the lab
                git 'https://github.com/nb6088/spring-petclinic.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-creds']) {
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh "kubectl set image deployment/petclinic-deployment petclinic-app-container=${DOCKER_IMAGE}"
            }
        }
    }
}
