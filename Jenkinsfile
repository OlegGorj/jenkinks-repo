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
                echo 'INFO: Executing Ansible Playbook...'
            
                echo 'INFO: Finish execution of Ansible Playbook...'
            }
        }
    }
}


