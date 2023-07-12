pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                echo "Build" 
                sh 'touch jj'
            }
        }
        stage('Test') { 
            steps {
                echo "Test" 
                fileExists 'jj'
            }
        }
        stage('Deploy') { 
            steps {
                echo "Deploy" 
            }
        }
    }
}