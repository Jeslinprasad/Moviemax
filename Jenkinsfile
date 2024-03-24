pipeline {
    agent any
    tools {
        // Define tools used in the pipeline
        jdk 'jdk17'
        nodejs 'node16'
    }
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }
    stages {
        stage('Clean Workspace') {
            steps {
                // Clean workspace before starting the build
                cleanWs()
            }
        }
        stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/N4si/DevSecOps-Project.git'
            }
        }
        stage('Build') {
            steps {
                // Install dependencies using npm
                sh 'npm install'
            }
        }
    }
}


