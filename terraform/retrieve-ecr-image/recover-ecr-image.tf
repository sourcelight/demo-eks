terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

# Specify the name of your ECR repository
data "aws_ecr_repository" "my_ecr_repo" {
  name = "eks/demo-springboot" # Replace with the name of your repository
}

variable "image_tag" {
  type        = string
  description = "Image tag to recover"
  default     = "1.0.0"
}

# Output the full ECR URL
output "ecr_image_url" {
  value = "${data.aws_ecr_repository.my_ecr_repo.repository_url}:${var.image_tag}" # Replace <tag> with your specific image tag
}