pipelineJob('aurora-postgres-cluster-existing-vpc') {
   definition {
               
    cps {
      script(readFileFromWorkspace('aurora-monitoring'))
      script(readFileFromWorkspace('aurora-postgres-cluster-existing-vpc'))
      script(readFileFromWorkspace('aurora-postgres-cluster-global-db'))
      script(readFileFromWorkspace('db-proxy-to-existing-postgres-cluster'))
      sandbox()     
    }
 
   }
}