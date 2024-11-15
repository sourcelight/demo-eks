resource "aws_ecs_task_definition" "my_first_task" {
  family                   = "my-first-task"
  container_definitions    = <<DEFINITION
[
  {
    "name": "my-first-task",
    "image": "${data.aws_ecr_repository.eks_springboot_ecr_repo.repository_url}:${var.image_tag}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 8080
      }
    ],
    "memory": 512,
    "cpu": 256,
    "networkMode": "awsvpc"
  }
]
  DEFINITION
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = 512
  execution_role_arn       = data.aws_iam_role.ecsTaskExecutionRole.arn
  cpu                      = 256
}