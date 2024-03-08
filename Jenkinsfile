pipeline {
    agent any
    tools {
        // Define tools used in the pipeline
        jdk 'jdk17'
        nodejs 'node16'
    }
    stages {
        stage('Clean Workspace') {
            steps {
                // Clean workspace before starting the build
                cleanWs()
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

