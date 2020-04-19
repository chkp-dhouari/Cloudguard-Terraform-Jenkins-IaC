pipeline {
 agent any
 
 stages {
 stage(‘checkout TF dev branch’) {
 steps {
  checkout SCM
 
 }
 
 }
 stage(‘Test TF’) {
 steps {
 
 sh ‘terraform — version’
 
 
 }
 }
 
 
 
 
 
 }
}
