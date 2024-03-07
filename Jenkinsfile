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
