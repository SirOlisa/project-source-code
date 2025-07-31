pipeline{
    agent any
    tools{
        maven 'maven-3.8'
    }
    stages{

        stage('Prepare Workspace') {
            steps {
                cleanWs()
                checkout scm
            }
        }
        // sonar cloud analysis
        // stage('CompileandRunSonarAnalysis'){
        //     steps{
        //         script {
        //             withCredentials([string(credentialsId: 'tech365token', variable: 'tech365token')]) {
        //                 sh 'mvn clean verify sonar:sonar -Dsonar.token=$tech365token -Dsonar.organization=tech3651 -Dsonar.projectKey=tech3651 -Dsonar.host.url=https://sonarcloud.io'
        //             }
        //         }
        //     }
        // }

        // stage('Run scan analysis with Snyk '){
        //     steps{
        //         script {
        //             withCredentials([string(credentialsId: 'SNYK_TOKEN', variable: 'SNYK_TOKEN')]) {
        //                 sh "mvn snyk:test -fn"
        //             }
        //         }
        //     }
        // }

        stage('Build docker image'){
            steps{
                withDockerRegistry([credentialsId:'dockerhubcred', url: '']) {
                    script{
                        app = docker.build("myapp")
                    }
                }
            }
        }

        stage('Push Docker Image to Docker Hub'){
            steps{
                script{
                    docker.withRegistry('https://418272776333.dkr.ecr.us-east-1.amazonaws.com','ecr:us-east-1:aws-credentials') {
                    app.push("latest")
                }
                }
            }
        }

    //     post {
    //     always {
    //         cleanWs() // This will clean the workspace after every build
    //     }
    // }

    }


}
