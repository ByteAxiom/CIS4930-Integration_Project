pipeline {
    agent any
    stages {
        stage('Checkout') {
        steps { checkout scm }
        }
        stage('Build Image') {
            steps { sh 'docker build -t my-app:latest .' }
        }
        stage('Terraform Init') {
            steps { sh 'terraform init' }
        }
        stage('Terraform Apply') {
            steps { sh 'terraform apply -auto-approve' }
        }
    }
}