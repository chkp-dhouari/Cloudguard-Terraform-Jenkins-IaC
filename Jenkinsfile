pipeline {
 agent any
 
 stages {
   stage(‘checkout terraform dev branch’) {
     steps {
       checkout scm
 
      }
 
    }
 stage(‘Test terraform ver’) {
   steps {
 
     sh ‘terraform — version’
 
 
       }
     }
 
 
 
 
 
  }
}
