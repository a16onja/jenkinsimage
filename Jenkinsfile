node {
	def registryProject='registry.gitlab.com/xavki/presentations-jenkins'
	def IMAGE="${registryProject}:version-${env.BUILD_ID}"
	
	stage('Clone') {
<<<<<<< HEAD
	    git credentialsId: 'onja', url: 'https://github.com/a16onja/jenkinsimage.git'
=======
		checkout scm
	}
	stage('Build image') {
		app = docker.build("onja/nginx")
	}
	stage('Test image') {
		docker.image('onja/nginx').withRun('-p 8069:80') { c ->
			sh 'docker ps'
			sh 'curl localhost:8069'
		}
>>>>>>> bdf4dc7a2f4d874ac37a4fe65adac728ae75bce0
	}
    
    def img = stage('Build') {
        docker.build("$IMAGE", '.')
    }
    
    stage('Run') {
        img.withRun("--name run-$BULD_ID -p 8070:80") { c ->
            sh 'curl localhost:8070'
        }
    }
    
    stage('Push') {
        docker.withRegistry('https://registry.gitlab.com', 'reg1') {
            img.push 'latest'
            img.push()
        } 
    }
}

