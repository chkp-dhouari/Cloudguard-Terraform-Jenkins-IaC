pipeline {
 agent any
 
 stages {
   stage(‘checkout’) {
     
    steps {
       checkout scm
 
      }
 
    }
 stage(‘ver’) {
   
  steps {
 
     sh ‘terraform — version’
 
 
       }
     }
 
 
 
 
 
  }
}
