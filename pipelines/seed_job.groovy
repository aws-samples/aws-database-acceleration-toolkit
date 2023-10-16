pipelineJob('aurora-postgres-cluster-existing-vpc') {
   definition {
               
    cps {
      script(readFileFromWorkspace('aurora-postgres-cluster-existing-vpc'))
  
      sandbox()     
    }
 
   }
}