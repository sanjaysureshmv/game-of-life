pipeline {
  agent any
  stages {
    stage('fetch from github') {
      steps {
        git(url: 'https://github.com/wakaleo/game-of-life.git', branch: 'master')
      }
    }
    stage('build the project') {
      steps {
        sh 'mvn package'
      }
    }
    stage('copy the artifacts to docker server') {
      steps {
        sh 'scp gameoflife.web/target/gameoflife.war jenkins@34.214.210.122:/home/jenkins'
      }
    }
  }
}