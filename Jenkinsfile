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
                sh "echo 'Region: ' ${params.Region_}"
                sh "echo 'Env: ' ${params.Environment_}"
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

                ansiblePlaybook('/Users/Git/jenkinks-repo/playbooks/playbook1.yml') {
                  inventoryPath('/Users/Git/jenkinks-repo/hosts')
                  ansibleName('ansible 2.4.0.0')
                  sudo(false)
                  extraVars {
                      extraVar("key1", "value1", false)
                      extraVar("key2", "value2", true)
                  }
                }
            }

        }
    }
}
