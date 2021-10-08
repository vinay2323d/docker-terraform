pipeline {
    agent any

    stages{
        stage('SCM') {
            steps {
                git 'https://github.com/vinay2323d/docker-terraform.git'
	     }
	}
        stage('Build Docker Image'){
            steps{
                sh "docker build -t vinayvicky/wep_terraform:${BUILD_NUMBER} ."
            }
        }
        stage('Push Docker Image to Dockerhub'){
            steps{
                sh "docker login -u vinayvicky -p 12345654321A"
                sh "docker push vinayvicky/wep_terraform:${BUILD_NUMBER}"
            }
        }
        stage('Run Terraform script'){
            steps{
                sh "sed -i 's/ImageTag/${BUILD_NUMBER}/g' docker-terraform.tf" 
                sh "terraform destroy -auto-approve"
                sh "terraform init"
                sh "terraform validate"
                sh "terraform apply -auto-approve"
            }
        }
   }
}
   
