pipeline {

	environment {
    registry = "srujanswaroop/javacalc"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages 
    {
    stage('Clean') {
      steps {
        sh 'mvn clean'
      }
    }
    stage('Compile') {
      steps {
        sh 'mvn compile'
      }
    }
    stage('Test') {
      steps {
        sh 'mvn test'
      }
    }
    stage('DockerHub') {
      stages{
        stage('Build Image') {
          steps{
            script {
              dockerImage = sudo docker build -t srujanswaroop/javacalc:latest .
            }
          }
        }
        stage('Push Image') {
          steps{
            script {
              docker.withRegistry( '', registryCredential ) {
                dockerImage.push()
              }
            }
          }
        }
      }
    }
  }
}