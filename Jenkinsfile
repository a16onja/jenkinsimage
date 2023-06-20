node {
	def app
	stage('Clone') {
		checkout scm
	}
	stage('Build image') {
		app = docker.build("onja/nginx")
	}
	stage('Test image') {
		docker.image('onja/nginx').withRun('-p 8008:80') { c ->
			sh 'docker ps'
			sh 'curl localhost'
		}
	}
}

