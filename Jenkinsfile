pipeline {
    agent any

    tools {
        // Define any necessary tools like Maven or JDK if your project requires them
        // maven 'Maven 3.8.1'
        // jdk 'JDK 11'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-org/your-repo.git' // Replace with your repository URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("your-registry/your-image-name:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'your-docker-registry-credentials-id', url: 'https://your-docker-registry-url') {
                        // Push the Docker image to the registry
                        docker.image("your-registry/your-image-name:${env.BUILD_NUMBER}").push()
                        docker.image("your-registry/your-image-name:latest").push() // Optionally push a 'latest' tag
                    }
                }
            }
        }
    }
}