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

    stage('Docker Image') {
      steps {
        sh 'docker.build registry + ":$BUILD_NUMBER"'
      }
    }

    stage('DockerHub') {
      steps {
        sh '''docker.withRegistry( \'\', registryCredential ) {
            dockerImage.push()
}'''
        }
      }

      stage('Deploy using Rundeck') {
        steps {
          sh '''step([$class: "RundeckNotifier",
          rundeckInstance: "Rundeck",
          shouldFailTheBuild: true,
          shouldWaitForRundeckJob: true,
          options: """
            BUILD_VERSION=$BUILD_NUMBER
          """,
          jobId: "52c6c24b-e155-43a9-913c-2cb7b6e51f91"])'''
        }
      }

    }
    environment {
      registry = 'srujanswaroop/javacalc'
      registryCredential = 'dockerhub'
    }
  }