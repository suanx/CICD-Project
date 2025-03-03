pipeline {
    agent any
    tools {
        jdk 'java-11'
        maven 'maven'
    }
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'repo link'
            }
        }
        stage('Compile with Maven') {
            steps {
                sh 'mvn compile'
            }
        }
        stage('Package with Maven') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t usernameofdockerhub/imagenameyourown .'
            }
        }
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                    sh 'echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin'
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh 'docker push usernameofdockerhub/imagenameyourown'
            }
        }
        stage('Container Creation') {
            steps {
                sh 'docker run -it -d --name c1 -p 9000:8080 imagesid'
            }
        }
    }
}
