pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'suanx/gfx:latest'
    }
    stages {
        stage('Git Clone - Pull files from repo') {
            steps {
                git 'https://github.com/suanx/CICD-Project.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'  // Optional: Add --no-cache if needed
            }
        }
        stage('Login to Docker Hub') {  
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'DOCKER_PASS', passwordVariable: 'password', usernameVariable: 'username')]) {
                        sh '''
                            echo "$password" | docker login -u "$username" --password-stdin
                            echo "Docker login successful"
                        '''
                    }
                }
            }
        }
        stage('Push Docker Image to Hub') {
            steps {
                sh 'docker push $DOCKER_IMAGE'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'microk8s.kubectl apply -f deploy.yml'
            }
        }
    }
}
