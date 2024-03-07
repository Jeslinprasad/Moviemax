pipeline {
    agent any
    
    // Define stages of the pipeline
    stages {
        // Clean workspace before starting the build
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
        
        // Checkout source code from version control
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'myid', url:'https://github.com/Jeslinprasad/Moviemax.git' tool: 'git'
            }
        }
        
        // Build frontend assets
        stage('Build') {
            steps {
                // Install dependencies
                sh 'npm install'
                // Build frontend assets
                sh 'npm run build'
            }
        }
    }
}
