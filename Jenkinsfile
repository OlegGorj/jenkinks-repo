pipeline {
    agent any
    parameters {
        choice(choices: 'DEV\nQA\nSTG\nPRD', description: 'What environment?', name: 'env_')

        string(name: 'username_', defaultValue: 'defaultuser', description: 'you required to provide your id')

        choice(choices: 'US-EAST-1\nUS-WEST-2', description: 'What AWS region?', name: 'Region')
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
                sh "echo 'Region: ' ${params.Region}"
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
                echo 'INFO: Start of Ansible playbook'
                ansiblePlaybook installation: 'ansible 2.4.0.0', inventory: '/Users/Git/jenkinks-repo/hosts', playbook: '/Users/Git/jenkinks-repo/playbooks/playbook1.yml', sudoUser: null

            }
        }
    }
}
