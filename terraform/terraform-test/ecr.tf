resource "aws_ecr_repository" "my_first_ecr_repo" {
  name = "my-first-ecr-repo"
  tags = {
    Name = "latest_ecr"
  }
}