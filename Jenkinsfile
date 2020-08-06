pipeline {
    agent any
    tools
    {
    	maven 'MAVEN_HOME'
    }
    stages {
       stage('Checkout'){
          steps {
             echo 'build in from master branch'
              git 'https://github.com/ParushaSingla/EmployeeApp.git'
          }
       }
       stage('Build'){
          steps{
            echo 'building..'
            bat "mvn clean install"
          }
       }
        stage('Test'){
          steps{
            echo 'testing..'
            bat "mvn test"
          }
       }
        stage('Sonar Analysis'){
          steps{
            echo 'Sonar Analysis..'
            withSonarQubeEnv("LocalSonar")
            {
              bat "mvn sonar:sonar"
            }
          }
       }
       stage('Upload to Artifactory'){
          steps{
            echo 'Artifactory.. '
            rtMavenDeployer(
            id:'deployer',
            serverId:'parusha.singla',
            releaseRepo:'pipeline_2020',
            snapshotRepo:'pipeline_2020',
            )
            rtMavenRun(
            pom:'pom.xml',
            goals:'clean install',
            deployerId:'deployer'
            )
            rtPublishBuildInfo(
            serverId:'parusha.singla'         
            )
          }
       }
    }
}