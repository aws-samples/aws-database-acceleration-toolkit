output cluster_endpoint {
     value         = module.aurora_poc.cluster_endpoint
}

output cluster_arn {
     value         = module.aurora_poc.cluster_arn
}

output cluster_id {
     value         = module.aurora_poc.cluster_id
}

output cluster_master_password {
     value         = module.aurora_poc.cluster_master_password
     sensitive     = true
}

output cluster_master_username {
     value         = module.aurora_poc.cluster_master_username
     sensitive     = true
}