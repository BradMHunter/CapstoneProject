pipeline {
    agent any

    stages{
        stage('deploy to S3'){
            steps{
                sh 'aws s3 cp public/index.html s3://mys3website-ac'
                sh 'aws s3api put-object-acl --bucket mys3website-ac --key index.html --acl public-read'
                sh 'aws s3 cp public/error.html s3://mys3website-ac'
                sh 'aws s3api put-object-acl --bucket mys3website-ac --key error.html --acl public-read'
            }
        }
    }
    post{
        always{
            cleanWs disableDeferredWipeout: true, deleteDirs: true
        }
    }

}
