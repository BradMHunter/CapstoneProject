pipeline {
  agent any
  stages {
    stage('Build blue image') {
      steps {
        withCredentials(bindings: [[$class: 'UsernamePasswordMultiBinding', credentialsId: 'docker', usernameVariable: 'docker', passwordVariable: 'DOCKER_PASSWORD']]) {
          sh '''
						docker build -t BradMHunter/CapstoneProject .
					'''
        }

      }
    }

    stage('Push blue image') {
      steps {
        withCredentials(bindings: [[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]) {
          sh '''
						docker login -u docker -p docker
						docker push BradMHunter/CapstoneProject
					'''
        }

      }
    }

    stage('create the kubeconfig file') {
      steps {
        withAWS(region: 'us-east-2', credentials: 'aws-credential') {
          sh '''
						aws eks --region us-east-2 update-kubeconfig --name jenkinscluster
					'''
        }

      }
    }

    stage('Deploy blue container') {
      steps {
        withAWS(region: 'us-east-2', credentials: 'aws-credential') {
          sh '''
						kubectl apply -f ./blue/blue-controller.json
					'''
        }

      }
    }

    stage('Redirect service to blue container') {
      steps {
        withAWS(region: 'us-east-2', credentials: 'aws-credential') {
          sh '''
						kubectl apply -f ./blue-green-service.json
					'''
        }

      }
    }

    stage('Get Services') {
      steps {
        withAWS(region: 'us-east-2', credentials: 'aws-credential') {
          sh '''
						kubectl get services
					'''
        }

      }
    }

  }
}