pipeline {
    agent any
    parameters {
        choice(choices: 'DEV\nQA\nSTG\nPRD', description: 'The environment?', name: 'env_')

        string(name: 'username_', defaultValue: 'defaultuser', description: 'you required to provide your id')

        choice(choices: 'US-EAST-1\nUS-WEST-2', description: 'What AWS region?', name: 'region_')
    }
    stages {
        stage('Setup') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }
        stage('Sanity check') {
             steps {
                 input "Does the environment  ${params.env_} look ok?"
             }
        }
        stage('Build') {
            steps {
                echo 'INFO: Building..'
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
}
