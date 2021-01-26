pipeline {
    agent any
    stages {
        stage('Submit Stack') {
            steps {
            sh "aws cloudformation create-stack --stack-name Test --template-body file://config.yml --region 'us-east-2'"
              }
             }
            }
            }
