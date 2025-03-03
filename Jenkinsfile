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
    }
}
