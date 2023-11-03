// Variables
// ----------------------
github_source   = "main"
github_org      = "aws-samples"
github_repo     = "aws-database-acceleration-toolkit"
credentials_id  = "8678d978-323c-4bf8-bf0a-5b6979538c6b"

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

pipelineJob('aurora-monitoring') {
   definition {
               
    cps {
      script(readFileFromWorkspace('pipelines/aurora-monitoring'))
      sandbox()     
    }
 
   }
}

pipelineJob('aurora-postgres-cluster-existing-vpc') {
   definition {
               
    cps {
      script(readFileFromWorkspace('pipelines/aurora-postgres-cluster-existing-vpc'))
      sandbox()     
    }
 
   }
}

pipelineJob('aurora-postgres-cluster-global-db') {
   definition {
               
    cps {
      script(readFileFromWorkspace('pipelines/aurora-postgres-cluster-global-db'))
      sandbox()     
    }
 
   }
}

pipelineJob('db-proxy-to-existing-postgres-cluster') {
   definition {
               
    cps {
      script(readFileFromWorkspace('pipelines/db-proxy-to-existing-postgres-cluster'))
      sandbox()     
    }
 
   }
}
