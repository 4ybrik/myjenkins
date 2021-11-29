pipeline{
    agent any
    environment{
        dockerImage=''
        registry='a9fef026aa43/new-app'
        registryCredential='github-ssh'
    }
    stages{
        stage('Checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-ssh', url: 'https://github.com/4ybrik/myjenkins.git']]])
            }
        }
        stage('Build Image'){
            steps{
                script{
                    dockerImage = docker.build registry
                }
            }
        }
        stage('Uploading'){
            steps{
                script{
                    docker.withRegistry('',registryCredential){
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
