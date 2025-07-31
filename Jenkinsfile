pipeline{
    agent any
    tools{
        maven 'maven-3.8'
    }
    stages{
        // sonar cloud analysis 
        stage('CompileandRunSonarAnalysis'){
            steps{
                withCredentials([string(credentialsId:'sonartoken', variable:'sonartoken')]){
                    sh 'mvn clean verify sonar:sonar -Dsonar.login=$sonartoken -Dsonar.organization=tech365 -Dsonar.projectKey=tech365key -Dsonar.host.url=https://sonarcloud.io'
                }
            }
        }
    }
}