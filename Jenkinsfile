pipeline{
    agent any
    tools{
        maven 'maven-3.8'
    }
    stages{
        // sonar cloud analysis 
        stage('CompileandRunSonarAnalysis'){
            steps{
                script {
                    withCredentials([string(credentialsId: 'tech365token', variable: 'tech365token')]) {
                        sh 'mvn clean verify sonar:sonar -Dsonar.login=$tech365token -Dsonar.organization=tech3651 -Dsonar.projectKey=tech3651 -Dsonar.host.url=https://sonarcloud.io'
                    }
                }
            }
        }
    }
}