#I recover the ecsTaskExecutionRole directly from AWS(it already exists there)

#resource "aws_iam_role" "ecsTaskExecutionRole1" {
#  name               = "ecsTaskExecutionRole1"
#  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
#}
#
#data "aws_iam_policy_document" "assume_role_policy" {
#  statement {
#    actions = ["sts:AssumeRole"]
#    principals {
#      type        = "Service"
#      identifiers = ["ecs-tasks.amazonaws.com"]
#    }
#  }
#}