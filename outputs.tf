output "cluster_endpoint" {
  description = "The endpoint of the EKS cluster."
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks.cluster_id
}

output "cluster_certificate_authority_data" {
  description = "The certificate authority data for the EKS cluster."
  value       = module.eks.cluster_certificate_authority_data
}
