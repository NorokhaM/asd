pipeline {
	agent any

    environment {
		DOCKER_CREDENTIALS_ID = 'dockerhub'
		DOCKER_IMAGE = 'myapp:latest'
	}

	triggers {
		pollSCM('* * * * *')
	}

	stages {
		stage('Git clone') {
			steps {
				script {
					git 'https://github.com/NorokhaM/asd.git'
				}
			}
		}
		stage('Build an Docker image') {
			steps {
				script {
					sh 'docker build -t $DOCKER_IMAGE .'
				}
			}
		}
		stage('Run Docker container') {
			steps {
				script {
					sh 'docker run -d -p 8081:8081 $DOCKER_IMAGE'
				}
			}
		}
	}
}
