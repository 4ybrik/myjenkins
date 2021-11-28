pipeline { 
  agent { label 'linux' }
  options {
   buildDiscarder(logRotator(numToKeepStr: '5')) 
  }
  environment {
   DOCKERHUB_CREDENTIALS = credentials('gibkiy-ssh') 
  }
  stages{
    stage('Build') {
      steps{
        sh 'docker build -t a9fef026aa43/jenkins-app:latest .'
      }
    }
    stage('Login'){
      steps{
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push'){
      steps{
        sh 'docker push a9fef026aa43/jenkins-app:latest'
      }
    }
  }
  post{
    always{
      sh 'docker logout'
    }
  }
}
