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
     value         = nonsensitive(module.aurora_poc.cluster_master_password)
}

output cluster_master_username {
     value         = nonsensitive(module.aurora_poc.cluster_master_username)
}