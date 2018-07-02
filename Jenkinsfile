pipeline {
  agent any
  stages {
    stage('fetch from my git ') {
      steps {
        sh 'git(url: \'https://github.com/wakaleo/game-of-life.git\', branch: \'master\')'
      }
    }
  }
}