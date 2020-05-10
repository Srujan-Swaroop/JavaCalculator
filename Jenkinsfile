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

    stage('Install/Run') {
      steps {
        sh 'mvn install'
      }
    }

  }
  environment {
    registry = 'srujanswaroop/javacalc'
    registryCredential = 'dockerhub'
  }
}