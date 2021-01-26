pipeline {
    agent any

    stages{
        stage('deploy to S3'){
            steps{
                sh 'aws s3 cp templates/index.html http://mytestsa.s3-website.us-east-2.amazonaws.com'
                sh 'aws s3api put-object-acl --bucket http://mytestsa.s3-website.us-east-2.amazonaws.com --key index.html --acl public-read'
                sh 'aws s3 cp templates/error.html http://mytestsa.s3-website.us-east-2.amazonaws.com'
                sh 'aws s3api put-object-acl --bucket http://mytestsa.s3-website.us-east-2.amazonaws.com --key error.html --acl public-read'
            }
        }
    }
    post{
        always{
            cleanWs disableDeferredWipeout: true, deleteDirs: true
        }
    }

}
