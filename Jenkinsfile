pipeline {
    agent any
    stages {       
        stage('Build green image') {
            steps {
			    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub_id', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
				    sh '''
						docker build -t bmhunter/testgreenimage -f green/Dockerfile .
					'''
			    }
		    }
        }        
        stage('Push green image') {
            steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub_id', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh '''
						docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
						docker push bmhunter/testgreenimage
					'''
				}
			}
        }
        stage('create the kubeconfig file') {
            steps {
				withAWS(region:'us-east-2', credentials:'udapeople_deploy') {
					sh '''
						aws eks --region us-east-2 update-kubeconfig --name cap
					'''
				}
			}
        }
        stage('Deploy blue container') {
            steps {
				withAWS(region:'us-east-2', credentials:'udapeople_deploy') {
					sh '''
						kubectl apply -f ./green/green-controller.json
					'''
				}
			}
        }
        stage('Redirect service to blue container') {
            steps {
				withAWS(region:'us-east-2', credentials:'udapeople_deploy') {
					sh '''
						kubectl apply -f ./blue-green-service.json
					'''
				}
			}
        }
		stage('Get Services') {
            steps {
				withAWS(region:'us-east-2', credentials:'udapeople_deploy') {
					sh '''
						kubectl get services
					'''
				}
			}
        }
        
     }
}
