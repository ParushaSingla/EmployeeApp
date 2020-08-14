pipeline {
    agent any
    tools
    {
    	maven 'MAVEN_HOME'
    	jdk 'JDK 13'
    }
    environment { 
        registry = "parushasingla/devopssampleapplication_coe_devops" 
        registryCredential = 'dockerhub_id' 
        dockerImage = ''
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
          bat "docker push parushasingla/devopssampleapplication_coe_devops:${BUILD_NUMBER}"
           }
       }
        stage('Cleaning up') { 
            steps { 
                bat "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}