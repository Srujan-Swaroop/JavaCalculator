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
    stage('Docker Build') {
      agent any
      steps {
        sh 'sudo docker build -t srujanswaroop/javacalc:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push srujanswaroop/javacalc:latest'
        }
      }
    }
  }
}