pipeline {
    agent any
     environment {
           SG_CLIENT_ID = credentials("SG_CLIENT_ID")
           SG_SECRET_KEY = credentials("SG_SECRET_KEY")
           privatekey = credentials("privatekey")
           }

   stages {

     stage('checkout Terraform files to deploy infra') {
      steps {
        checkout scm
       }

     }
    
      stage('Terraform Code SourceGuard SAST Scan') { 
          agent {
               docker { image 'dhouari/devsecops'
                         args '--entrypoint=' }
                       }
          steps { 
             script {      
                 try {
                     
                     sh 'sourceguard-cli --src .'
           
                   } catch (Exception e) {
    
                   echo "Request for Code Review Approval"  
                  }
               }
            }
         }
       
         stage('Code approval request') {
     
           steps {
             script {
               def userInput = input(id: 'confirm', message: 'Do you Approve to use this code?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Approve Code to Proceed', name: 'approve'] ])
              }
            }
          }


    stage('init Terraform') {
       agent {
               docker { image 'dhouari/devsecops'
                         args '--entrypoint=' }
                       }
        steps {
           withAWS(credentials: 'awscreds', region: 'us-east-1'){
               
             sh "terraform init --upgrade && terraform plan"
            
            }
         }
     }  
       
   stage('Terraform plan approval request') {
      steps {
        script {
          def userInput = input(id: 'confirm', message: 'Do you Approve the Terraform Plan?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Confirm to Approve Terraform Plan', name: 'approve'] ])
        }
      }
    }
        
   stage('Deploy the Terraform infra') {
       agent {
               docker { image 'dhouari/devsecops'
                         args '--entrypoint=' }
                       }
        steps {
          withAWS(credentials: 'awscreds', region: 'us-east-1'){
             
             sh "terraform apply --auto-approve"
            
          }
       }
    }

  }
}


