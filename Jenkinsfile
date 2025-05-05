pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/filandijeffrey/IT-for-All.git'

            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('fjeffrey/simple-site')
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'docker-hub-creds', url: '']) {
                        docker.image('fjeffrey/simple-site').push('latest')
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 8081:80 fjeffrey/simple-site'
            }
        }
    }
}
