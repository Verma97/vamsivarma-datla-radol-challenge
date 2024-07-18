variable "aws_region" {
  description = "The AWS region to deploy the EKS cluster in."
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  default     = "superset-cluster"
}

variable "key_name" {
  description = "The name of the SSH key pair."
  default     = "my-key"
}

