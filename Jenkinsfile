pipeline {
	agent any
    environment {
        DOCKERHUB_CREDENTIALS = '8098c0fa-5709-43f6-bd17-8a617f12ad51'
        IMAGE_NAME = 'myapp'
        IMAGE_TAG = 'latest'
    }
    stages {
		stage('Build and Run Docker Image') {
			steps {
				script {

                    withCredentials([usernamePassword(credentialsId: DOCKERHUB_CREDENTIALS, usernameVariable: 'DOCKERHUB_USERNAME',
passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"

                        sh "docker build -t ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG} ."

                        sh "docker tag ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG} index.docker.io/${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"

                        sh "docker run -d -p 8080:8080 ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
                    }
                }
            }
        }
    }
    post {
		always {
			echo 'Pipeline finished'
        }
    }
}