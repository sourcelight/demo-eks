#resource "aws_ecr_repository" "my_first_ecr_repo" {
#  name = "my-first-ecr-repo"
#  tags = {
#    Name = "latest_ecr"
#  }
#}

//The repository is already present in the account, so we need to recover it


# Specify the name of your ECR repository
data "aws_ecr_repository" "eks_springboot_ecr_repo" {
  name = "eks/demo-springboot" # Replace with the name of your repository
}

variable "image_tag" {
  type        = string
  description = "Image tag to recover"
  default     = "1.0.0"
}

data "aws_iam_role" "ecsTaskExecutionRole" {
  name = "ecsTaskExecutionRole" # Replace with the actual role name
}



# Output the full ECR URL
output "ecr_image_url" {
  value = "${data.aws_ecr_repository.eks_springboot_ecr_repo.repository_url}:${var.image_tag}" # Replace <tag> with your specific image tag
}

# Outputting the ARN
output "role_arn" {
  value = data.aws_iam_role.ecsTaskExecutionRole.arn
}
