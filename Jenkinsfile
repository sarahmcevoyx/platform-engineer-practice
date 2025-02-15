pipeline {
    agent {
        label 'terraform-kitchen-agent'
    }

    environment {
        ARM_CLIENT_ID = credentials('azure-client-id')
        ARM_CLIENT_SECRET = credentials('azure-client-secret')
        ARM_SUBSCRIPTION_ID = credentials('azure-subscription-id')
        ARM_TENANT_ID = credentials('azure-tenant-id')
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from your version control system
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Install Ruby dependencies from Gemfile using Bundler
                    sh 'bundle install'
                }
            }
        }

        stage('TruffleHog Scan') {
            steps {
                script {
                    // Run TruffleHog to scan for secrets
                    sh 'trufflehog filesystem .'
                }
            }
            post {
                failure {
                    script {
                        currentBuild.result = 'FAILURE'
                        error('TruffleHog scan failed')
                    }
                }
            }
        }

        stage('Aqua Scan') {
            steps {
                script {
                    // Run Aqua scan for container security
                    sh 'aqua scan --local .'
                }
            }
            post {
                failure {
                    script {
                        currentBuild.result = 'FAILURE'
                        error('Aqua scan failed')
                    }
                }
            }
        }

        stage('Test Kitchen Setup') {
            steps {
                script {
                    // Run Kitchen-Terraform setup commands
                    sh 'bundle exec kitchen create'
                    sh 'bundle exec kitchen converge'
                }
            }
        }

        stage('Test Kitchen Verify') {
            steps {
                script {
                    // Run Kitchen-Terraform verification
                    sh 'bundle exec kitchen verify'
                }
            }
        }

        stage('Test Kitchen Destroy') {
            steps {
                script {
                    // Destroy Kitchen-Terraform instances
                    sh 'bundle exec kitchen destroy'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform in the TST directory
                    dir('env/TST') {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Generate Terraform plan
                    dir('env/TST') {
                        sh 'terraform plan -var-file=variables.tf -out=tfplan'
                    }
                }
            }
            post {
                failure {
                    script {
                        currentBuild.result = 'FAILURE'
                        error('Terraform plan failed')
                    }
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression {
                    currentBuild.result == null || currentBuild.result == 'SUCCESS'
                }
            }
            steps {
                script {
                    // Apply the Terraform plan
                    dir('env/TST') {
                        sh 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }

        stage('Run InSpec Check') {
            steps {
                script {
                    // Clone the inspec-check repository
                    sh 'git clone https://your-repo-url/inspec-check.git'

                    // Navigate to the inspec-check directory and run InSpec tests
                    dir('inspec-check') {
                        sh 'bundle exec inspec exec . --reporter=json'
                    }
                }
            }
            post {
                failure {
                    script {
                        currentBuild.result = 'FAILURE'
                        error('InSpec check failed')
                    }
                }
            }
        }

        stage('Update Changelog') {
            steps {
                script {
                    // Run the script to update the CHANGELOG.md file
                    sh './scripts/update_changelog.sh'
                }
            }
            post {
                success {
                    script {
                        // Push the updated CHANGELOG.md to the repository
                        sh 'git push origin HEAD:refs/heads/main'
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace
            cleanWs()
        }
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            script {
                def failedStage = currentBuild.rawBuild.getLog(100).find { it.contains('[Pipeline]') && it.contains('End of Pipeline') }
                echo "Pipeline failed at stage: ${failedStage ? failedStage.split(' ')[2] : 'Unknown'}"

                def errorLog = currentBuild.rawBuild.getLog(100).join('\n')
                echo "Error log:\n${errorLog}"
            }
        }
    }
}
