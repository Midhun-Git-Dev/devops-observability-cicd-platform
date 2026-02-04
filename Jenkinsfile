pipeline {
    agent any

    tools {
        maven 'maven3'
    }

    environment {
        IMAGE_NAME = 'midhun-tomcat-project'
        CONTAINER_NAME = 'midhun-tomcat-container'
        SONARQUBE_SERVER = 'sonarqube-server'
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('SonarQube Code Scan') {
            steps {
                withSonarQubeEnv("$SONARQUBE_SERVER") {
                    sh '''
                    mvn sonar:sonar \
                    -Dsonar.projectKey=midhun-docker-project \
                    -Dsonar.projectName=midhun-docker-project
                    '''
                }
            }
        }

        stage('Quality Gate Check') {
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Prepare WAR for Docker') {
            steps {
                sh '''
                rm -rf docker-tomcat-app/webapp || true
                mkdir -p docker-tomcat-app/webapp/target
                cp webapp/target/*.war docker-tomcat-app/webapp/target/
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                dir('docker-tomcat-app') {
                    sh "docker build -t $IMAGE_NAME ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                docker run -d -p 8085:8080 --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }
    }
}
