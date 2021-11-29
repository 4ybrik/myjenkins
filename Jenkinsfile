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
        stage('Docker stop container'){
            steps{
                sh 'docker ps -f name=myapp-container -q | xargs --no-run-if-empty docker container stop'
                sh 'docker container ls -a -fname=myapp-container -q | xargs -r docker container rm'
            }
        }
        stage('Docker run'){
            steps{
                script{
                    dockerImage.run("-p 8056:80 --rm --name myapp-container")
                }
            }
        }
    }
}
