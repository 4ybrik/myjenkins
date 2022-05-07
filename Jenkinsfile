pipeline{
    agent any
    environment{
        dockerImage=''
        registry='a9fef026aa43/mynewnginx'
        registryCredential='dockerhub_id'
    }
    stages{
        stage('Checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'dockerhub_id', url: 'https://github.com/isostheneia94/DevOps_Jenkins_ansible_task.git']]])
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
                    dockerImage.run("-p 8088:80 --rm --name dpld")
                }
            }
        }
    }
}
