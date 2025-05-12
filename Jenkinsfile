pipeline {
    agent any

    // environment {
    //     // Set any environment variables here
    //     // For example: NODE_ENV = 'development'
    // }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/devogs/fabric.git', branch: 'dev'
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform-netbox') {
                    sh 'terraform init'
                    sh 'terraform plan'
                }
            }
        }

    post {
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
