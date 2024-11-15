output "ecr_id" {
  description = "ECR ID"
  value = aws_ecr_repository.my_first_ecr_repo.id
}

output "ecr_imm-tag" {
  value = aws_ecr_repository.my_first_ecr_repo.image_tag_mutability
  description = "ECR Tag Mutability"
}

output "ecr_arn" {
  value = aws_ecr_repository.my_first_ecr_repo.arn
  description = "ECR ARN"
}
