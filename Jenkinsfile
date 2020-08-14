pipeline {
    agent any
    tools
    {
    	maven 'MAVEN_HOME'
    	jdk 'JDK 13'
    }
    environment { 
    registryCredential='dockerhub_id' 
    }
    stages {
       stage('Checkout'){
          steps {
             echo 'build in from master branch'
              git 'https://github.com/ParushaSingla/EmployeeApp.git'
          }
       }
       stage('Docker Image'){
         steps{
          bat "docker build -t parushasingla/devopssampleapplication_coe_devops:${BUILD_NUMBER} . --no-cache -f Dockerfile"
           }
       }
        stage('Push to DTR'){
         steps{
          script { 

                    docker.withRegistry( '', registryCredential ) { 
                     bat "docker push  parushasingla/devopssampleapplication_coe_devops:${BUILD_NUMBER}"
                    }

                } 
         
           }
       }
    }
}