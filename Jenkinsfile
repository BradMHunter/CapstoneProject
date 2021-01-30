environment {
    registry = "bmhunter/capstone"
    registryCredential = ‘dockerhub_id’
}
pipeline {
  agent any
  stages {
    stage('Build blue image') {
      steps {
        withCredentials(bindings: [[$class: 'UsernamePasswordMultiBinding', credentialsId: 'docker', usernameVariable: 'ubuntu', passwordVariable: 'ubuntu']]) {
          sh '''
						docker build -t brad/capstoneproject .
					'''
        }

      }
    }

      stage('create the kubeconfig file') {
      steps {
        withAWS(region: 'us-east-2', credentials: 'aws-credential') {
          sh '''
						aws eks --region us-east-2 update-kubeconfig --name cap
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
