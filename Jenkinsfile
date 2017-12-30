pipeline {

    agent any

    parameters {
        choice(choices: 'DEV\nQA\nSTG\nPRD', description: 'The environment?', name: 'env_')

        string(name: 'username_', defaultValue: 'defaultuser', description: 'you required to provide your id')

        choice(choices: 'US-EAST-1\nUS-WEST-2', description: 'What AWS region?', name: 'region_')
    }
    options {
        buildDiscarder(logRotator(numToKeepStr:'20'))
        timestamps()
        timeout(time: 90, unit: 'MINUTES')
    }
//    environment {
//    }

    stages {
        stage('Setup') {
            steps {

                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"

                script {
                    env.RELEASE_SCOPE = input message: 'User input required', ok: 'Release!',
                            parameters: [
                            choice(name: 'RELEASE_SCOPE', choices: 'patch\nminor\nmajor', description: 'What is the release scope?')
                            ]
                }
                echo "${env.RELEASE_SCOPE}"

            }
        }
        stage('Sanity check') {
             steps {
//                 input "Does the environment  ${params.env_} look ok?"
              echo 'INFO: Sanity checks.....'

             }
        }
        stage('Build') {
            steps {
                echo 'INFO: Building....'
                sh "echo 'User: ' ${params.username_}"
                sh "echo 'Region: ' ${params.region_}"
                sh "echo 'Env: ' ${params.env_}"
            }
        }
        stage('Test') {
            steps {
                echo 'INFO: Testing.....'
            }
        }
        stage('Deploy') {
            steps {
                echo 'INFO: Deploymnet Step....'
                echo 'INFO: Starting execution of Ansible playbook'

                ansiblePlaybook(
                  playbook: 'playbooks/playbook1.yml',
                  inventory: 'inventory/hosts',
                  extras: '-e Region=${region_} -e Environment=${env_} -e Username=${username_}' )
            }
        }

    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }

}
