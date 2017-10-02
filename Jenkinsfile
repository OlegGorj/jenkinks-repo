pipeline {
    agent any
    parameters {
        choice(choices: 'DEV\nQA\nSTG\nPRD', description: 'What environment?', name: 'env_')

        string(name: 'username_', defaultValue: 'defaultuser', description: 'you required to provide your id')

        choice(choices: 'US-EAST-1\nUS-WEST-2', description: 'What AWS region?', name: 'region_')
    }
    stages {
        stage('Setup') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                
                script {
                    MYLIST = []
                    MYLIST += "param-one"
                    MYLIST += "param-two"
                    MYLIST += "param-three"
                    MYLIST += "param-four"
                    MYLIST += "param-five"

                    for (def element = 0; element < MYLIST.size(); element++) {
                        build(
                            job: 'parameterized-job',
                            parameters: [
                                [
                                    $class: 'StringParameterValue',
                                    name: 'MYLIST',
                                    value: MYLIST[element]
                                ]
                            ]
                        )
                    }
                }
                
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
                echo 'INFO: Testing..'
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


