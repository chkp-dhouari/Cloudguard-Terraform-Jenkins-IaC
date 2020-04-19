pipeline {
 agent any
 
 stages {
 stage(‘checkout terraform dev branch’) {
 steps {
  checkout SCM
 
 }
 
 }
 stage(‘Test terraform ver’) {
 steps {
 
 sh ‘terraform — version’
 
 
 }
 }
 
 
 
 
 
 }
}
