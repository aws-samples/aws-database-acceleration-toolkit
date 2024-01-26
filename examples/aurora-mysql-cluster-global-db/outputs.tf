/*output cluster_endpoint {
     value         = module.aurora_poc.cluster_endpoint
}


output cluster_arn {
     value         = module.aurora_poc.cluster_arn
}

output cluster_id {
     value         = module.aurora_poc.cluster_id
}
*/

# aws_rds_cluster
output "aurora_cluster_arn" {
  description = "The ARN of the Primary Aurora cluster"
  value       = module.aurora_poc.aurora_cluster_arn
}

output "aurora_cluster_id" {
  description = "The ID of the Primary Aurora cluster"
  value       = module.aurora_poc.aurora_cluster_id
}
