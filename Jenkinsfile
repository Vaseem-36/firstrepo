// jenkins pipeline script
// pipeline with stages compile, test, package and echo message in the stages
// use maven to compile, test and package the application
// use docker to build the image and push to docker hub
// define environment variables mavenHome and dockerHome for the tools in jenkins

pipeline {
    agent any
    environment {
        mavenHome = tool 'mavenjenkins'
        dockerHome = tool 'dockerjenkins'
        PATH = "${mavenHome}/bin:${dockerHome}/bin:${PATH}"
    }
    stages {
        stage('Info') {
            steps {
                echo "$env.JOB_NAME"
                echo "$env.BUILD_NUMBER"
                echo "$env.BUILD_ID"
                echo "$env.BUILD_URL"
            }
            
        }
        stage('Compile') {
            steps {
                sh "mvn clean compile"
            }
        }
        stage('Test') {
            steps {
                sh "mvn test"
            }
        }
        stage('Package') {
            steps {
                sh "mvn package -DskipTests"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("vaseem36/firstrepo:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockercred') {
                        dockerImage.push()
                    }
                }
            }
        }
    
    }
    post{
        always{
            echo "This is always executed"
        }
        success{
            echo "This is executed only if the build succeeds"
        }
        failure{
            echo "This is executed only if the build fails"
        }
    }
}
