# ============================================
# CLUSTER OUTPUTS
# ============================================

output "cluster_id" {
  description = "The ID/name of the EKS cluster."
  value       = aws_eks_cluster.main.id
}

output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = aws_eks_cluster.main.name
}

output "cluster_arn" {
  description = "The ARN of the EKS cluster."
  value       = aws_eks_cluster.main.arn
}

output "cluster_endpoint" {
  description = "Kubernetes API server endpoint."
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_security_group_id" {
  description = "Security group created for the EKS control plane."
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}

output "cluster_certificate_authority_data" {
  description = "Cluster CA data (base64 encoded)."
  value       = aws_eks_cluster.main.certificate_authority[0].data
  sensitive   = true
}

output "cluster_version" {
  description = "Kubernetes version of the cluster."
  value       = aws_eks_cluster.main.version
}

# ============================================
# NODE GROUP OUTPUTS
# ============================================

output "node_group_id" {
  description = "Node group ID."
  value       = aws_eks_node_group.main.id
}

output "node_group_arn" {
  description = "Node group ARN."
  value       = aws_eks_node_group.main.arn
}

output "node_group_status" {
  description = "Status of the node group."
  value       = aws_eks_node_group.main.status
}

output "node_security_group_id" {
  description = "Security group attached to worker nodes."
  value       = tolist(aws_eks_cluster.main.vpc_config[0].security_group_ids)[0]
}


# ============================================
# OIDC PROVIDER OUTPUTS
# ============================================

output "oidc_provider_url" {
  description = "OIDC issuer URL for IRSA."
  value       = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

