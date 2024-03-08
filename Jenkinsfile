pipeline {
    agent any
    tools {
        jdk 'jdk17'
        nodejs 'node16'
    }
    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout') {
            steps {
              git branch: 'main', url: 'https://github.com/Jeslinprasad/Moviemax.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                // Install project dependencies
                sh 'npm install'
            }
        }
        stage('Run Tests') {
            steps {
             sh 'npm test'
            }
        }
        stage('Build') {
            steps {
             sh 'npm run build'
            }
        }
        stage('Deploy') {
            steps {
                 sh 'npm run deploy'
            }
        }
    }
}
