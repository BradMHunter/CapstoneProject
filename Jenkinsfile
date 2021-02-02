pipeline {
    agent any
    stages { stage('Lint HTML'){
                steps{
                   sh 'tidy -q -e *.html'
                }
            }
        stage('Build blue image') {
            steps {
			    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub_id', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
				    sh '''
						docker build -t bmhunter/testblueimage -f blue/Dockerfile .
					'''
			    }
		    }
        }        
        stage('Push blue image') {
            steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub_id', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh '''
						docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
						docker push bmhunter/testblueimage
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
						kubectl apply -f ./blue/blue-controller.json
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
