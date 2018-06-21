pipeline {
  agent any
  stages {
    stage('fetch from github') {
      steps {
        git(url: 'https://github.com/wakaleo/game-of-life.git', branch: 'master')
      }
    }
  }
}