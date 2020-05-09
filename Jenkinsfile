pipeline {
  agent any
  stages {
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
        sh 'mvn install'
      }
    }

    stage('Build Image') {
      steps {
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }

      }
    }

    stage('Push Image') {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }

      }
    }

  }
  environment {
    registry = 'srujanswaroop/javacalc'
    registryCredential = 'dockerhub'
  }
}