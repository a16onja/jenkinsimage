node {
	def registryProject='registry.gitlab.com/a16onja/jenkins'
	def IMAGE="${registryProject}:version-${env.BUILD_ID}"
	
	stage('Clone') {
	    git credentialsId: 'onja', url: 'https://github.com/a16onja/jenkinsimage.git'
	}
    
    def img = stage('Build') {
        docker.build("$IMAGE", '.')
    }
    
    stage('Run') {
        img.withRun("--name run-$BUILD_ID -p 8070:80") { c ->
            sh 'curl localhost:8070'
        }
    }
    
    stage('Push') {
        docker.withRegistry('https://registry.gitlab.com', 'a16onja') {
            img.push 'latest'
            img.push()
        } 
    }
}

