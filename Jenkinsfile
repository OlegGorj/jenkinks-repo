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
                ansible-playbook -i /Users/Git/jenkinks-repo/hosts /Users/Git/jenkinks-repo/playbooks/playbook1.yml
                echo 'INFO: Finish execution of Ansible Playbook...'
            }
        }
    }
}


