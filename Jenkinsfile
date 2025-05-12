pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/devogs/fabric.git', branch: 'dev'
            }
        }

        stage('Terraform Plan') {
            agent {
                docker {
                    image 'hashicorp/terraform:light'
                }
            }
            steps {
                dir('terraform-netbox') {
                    sh 'terraform init'
                    sh 'terraform plan'
                }
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
