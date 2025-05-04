pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/filandijeffrey/IT-for-All.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('filandijeffrey/it-for-all')
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'docker-hub-creds', url: '']) {
                        docker.image('filandijeffrey/it-for-all').push('latest')
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 8081:80 filandijeffrey/it-for-all'
            }
        }
    }
}
