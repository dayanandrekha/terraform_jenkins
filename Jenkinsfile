pipeline {
    agent any

    stages {

        // STEP 1: Checkout Source Code
        stage('Checkout') {
            steps {
                echo 'Checking out Terraform code...'
                git branch: 'main',
                    url: 'https://github.com/org/terraform-jenkins-local.git'
            }
        }

        // STEP 2: Terraform Init
        stage('Terraform Init') {
            steps {
                echo 'Running terraform init...'
                sh 'terraform init'
            }
        }

        // STEP 3: Terraform Validate
        stage('Terraform Validate') {
            steps {
                echo 'Validating terraform configuration...'
                sh 'terraform validate'
            }
        }

        // STEP 4: Terraform Plan
        stage('Terraform Plan') {
            steps {
                echo 'Generating terraform plan...'
                sh 'terraform plan -out=tfplan'
            }
        }

        // STEP 5: Approval
        stage('Manual Approval') {
            steps {
                input message: 'Approve Terraform Apply?'
            }
        }

        // STEP 6: Terraform Apply
        stage('Terraform Apply') {
            steps {
                echo 'Applying terraform plan...'
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
