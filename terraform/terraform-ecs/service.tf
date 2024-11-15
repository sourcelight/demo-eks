resource "aws_ecs_service" "my_first_services" {
  name                = "gft-test-first-services"
  cluster             = aws_ecs_cluster.my_cluster.id
  task_definition     = aws_ecs_task_definition.my_first_task.arn
  launch_type         = "FARGATE"
  scheduling_strategy = "REPLICA"
  desired_count       = 1

  network_configuration {
    subnets          = [aws_default_subnet.ecs_az1.id]
    assign_public_ip = true                               # This is crucial to assign a public IP
    security_groups  = [aws_security_group.allow_http.id] # Define the security group below
  }
}
