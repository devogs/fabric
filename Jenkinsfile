pipeline {
    agent any

    environment {
        // Set any environment variables here
        // For example: NODE_ENV = 'development'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/your-username/your-repo.git', branch: 'main'
            }
        }

        stage('Run test echo1') {
            steps {
                sh 'echo "This is the first test"'
                // Replace with actual command, e.g.:
                // sh 'npm install'
                // sh 'pip install -r requirements.txt'
            }
        }

        stage('Run test echo2') {
            steps {
                sh 'echo "This is the second test"'
                // Replace with actual test command, e.g.:
                // sh 'npm test'
                // sh 'pytest'
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
