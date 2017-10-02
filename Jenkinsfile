pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'INFO: Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'INFO: Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'INFO: Deploymnet Step....'
                echo 'INFO: `date` Start of Ansible playbook'
                ansiblePlaybook installation: 'ansible 2.4.0.0', inventory: '/Users/Git/jenkinks-repo/hosts', playbook: '/Users/Git/jenkinks-repo/playbooks/playbook1.yml', sudoUser: null

            }
        }
    }
}


