pipeline {
    agent any
    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/filandijeffrey/IT-for-All.git'
            }
        }
        stage('Build Image') {
            steps {
                script {
                    docker.build('fjeffrey/simple-site')
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-creds', url: '']) {
                    script {
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
