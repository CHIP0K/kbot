pipeline {
    agent any
    parameters {
        choice(name: 'OS', choices: ['linux', 'darwin', 'windows', 'all'], description: 'Pick OS')
        choice(name: 'ARCH', choices: ['amd64', 'arch64'], description: 'Pick ARCH')
    }
    environment {
        REPO = "https://github.com/CHIP0K/kbot.git"
        BRANCH = "main"
    }
    stages {
        stage('Info') {
            steps {
                echo "Build for platform ${params.OS}"
                echo "Build for arch: ${params.ARCH}"
            }
        }
        stage('clone') {
            steps {
                echo 'Clone repository'
                git branch: "${BRANCH}", url: "${REPO}"
            }
        }
        stage("test") {
            steps {
                echo 'Test execution started'
                sh 'make test'
            }
        }
        stage("build") {
            steps {
                echo 'Build execution started'
                sh 'make build'
            }
        }
        stage("image") {
            steps {
                script {
                    echo 'Build execution started'
                    sh 'make image'
                }
            }
        }
        stage("push") {
            steps {
                script {
                    docker.withRegistry('', dockerhub){
                        sh 'make push'
                    }
                }
            }
        }
    }
}
