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
   
        stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                bat "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}