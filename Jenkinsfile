pipeline {
    agent any
    stages {
        stage('Submit Stack') {
            steps {
            sh "aws cloudformation create-stack --stack-name Test --template-body file://CloudFormation/capstone-template.yml --region 'us-east-2'"
              }
             }
            }
            }
