// Variables
// ----------------------
github_source   = "main"
github_org      = "aws-samples"
github_repo     = "aws-database-acceleration-toolkit"
<<<<<<< HEAD:pipelines/aurora-monitoring
credentials_id  = "8678d978-323c-4bf8-bf0a-5b6979538c6b"
=======
credentials_id  = ""
>>>>>>> 4ee5bfb0d0feed07480918317c9e21c8098d3d9b:pipelines/auroramonitoring.groovy

// Function(s)
// ----------------------
def handleCheckout = {
  
  def regGithubSource    = ~/^v[\d|.]+/
  is_tag = regGithubSource.matcher(github_source).matches()
  if (is_tag == true) {
    gitref = 'refs/tags/'
  } else {
    gitref = 'refs/heads/'
  }
  
  checkout([ 
    $class: 'GitSCM',
    branches: [[name: gitref + github_source]], 
    doGenerateSubmoduleConfigurations: false, 
    extensions: [
      [
        $class: 'CloneOption',
        noTags: false,
        shallow: false,
        depth: 0,
        reference: ''
      ],
      [ 
        $class: 'SubmoduleOption', 
        depth: 1, 
        disableSubmodules: false, 
        parentCredentials: true, 
        recursiveSubmodules: true, 
        reference: '', 
        shallow: true, 
        trackingSubmodules: false
      ], 
      [$class: 'GitLFSPull']
    ], 
    submoduleCfg: [], 
    userRemoteConfigs: [[ credentialsId: credentials_id, url: 'https://github.com/' + github_org + '/' + github_repo + '.git']]
  ]);
}

pipeline {

    agent any

      parameters {
        string(defaultValue: "us-east-2", description: 'Region', name: 'REGION') 
        string(defaultValue: "dev", description: 'Environment', name: 'ENVIRONMENT')   
        string(defaultValue: "", description: 'VPC ID', name: 'VPC')   
    }

    environment {
        REGION="${params.REGION}"
        ENVIRONMENT = "${params.ENVIRONMENT}"
        VPC = "${params.VPC}"
        AWS_ACCESS_KEY_ID     = "abc"
        AWS_SECRET_ACCESS_KEY = "bcd"
    }
    stages {
stage('checkout') {
  
      steps {
        script {
          cleanWs()
          handleCheckout()
        }
      }
}
        stage('Terraform init') {
            steps{
                 sh '''
                 pwd
                   cd ./examples/aurora-monitoring
                   terraform init 
                '''
            }
        }
        stage('Terraform plan') {

            steps {
                 sh '''
                   cd ./examples/aurora-monitoring
                   terraform plan -var-file=terraform.tfvars -var="environment=${ENVIRONMENT}" -var="region=${REGION}" -var="vpc_id=${VPC}" -var="aws_access_key=${AWS_ACCESS_KEY_ID}" -var="aws_secret_key=${AWS_SECRET_ACCESS_KEY}"
                '''
               
            }

        }

         stage('Terraform apply') {

            steps {
                 sh '''
                   cd examples/aurora-monitoring
                   terraform apply -auto-approve -var-file=terraform.tfvars -var="environment=${ENVIRONMENT}" -var="region=${REGION}" -var="vpc_id=${VPC}" -var="aws_access_key=${AWS_ACCESS_KEY_ID}" -var="aws_secret_key=${AWS_SECRET_ACCESS_KEY}"
                '''  
            }

        }

    }

}
