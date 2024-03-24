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
                git branch: 'main', url: 'https://github.com/Jeslinprasad/Moviemax.git'
            }
        }
        stage("Sonarqube Analysis") {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Moviemax \
                    -Dsonar.projectKey=Moviemax'''
                }
            }
        }
        stage("quality gate") {
            steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'Sonar-token'
                }
            }
        }
        stage('Build') {
            steps {
                // Install dependencies using npm
                sh 'npm install'
            }
        }
        stage('OWASP FS SCAN') {
            steps {
                dependencyCheck additionalArguments: '--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation: 'DP-Check'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }
        stage('TRIVY FS SCAN') {
            steps {
                sh "trivy fs . > trivyfs.txt"
            }
        }
        stage("Docker Build & Push"){
            steps{
                script{
                   withDockerRegistry(credentialsId: 'docker', toolName: 'docker'){   
                       sh "docker build --build-arg VITE_API_KEY=6ec06a92526736ec3b1d71623ec83501 -t Moviemax ."
                       sh "docker tag Moviemax mdocker/Moviemax:latest "
                       sh "docker push mdocker/Moviemax:latest "
                    }
                }
            }
        }
        stage("TRIVY"){
            steps{
                sh "trivy image dmovie/Moviemax:latest > trivyimage.txt" 
            }
        }
        stage('Deploy to container'){
            steps{
                sh 'docker run -d -p 8081:80 dmovie/Moviemax:latest'
            }
        }
    }
}
    



