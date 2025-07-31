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
                        sh 'mvn clean verify sonar:sonar -Dsonar.token=$tech365token -Dsonar.organization=tech3651 -Dsonar.projectKey=tech3651 -Dsonar.host.url=https://sonarcloud.io'
                    }
                }
            }
        }

        stage('Run scan analysis with Snyk '){
            steps{
                script {
                    withCredentials([string(credentialsId: 'SNYK_TOKEN', variable: 'SNYK_TOKEN')]) {
                        sh "mvn snyk:test -fn"
                    }
                 }
            }
        }
    }
}