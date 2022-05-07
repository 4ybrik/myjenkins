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
        
        stage('Docker run'){
            steps{
                script{
                    dockerImage.run("-p 8088:80 --rm --name dpld")
                }
            }
        }
    }
}
