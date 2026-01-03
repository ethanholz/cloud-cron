# Scheduled Lambda Module

Provision a container-based Lambda function that runs on an EventBridge schedule and publishes to SNS topics.

## Usage

```hcl
resource "aws_sns_topic" "example_topic" {
  name = "example-topic"
}

module "scheduled_lambda" {
  source = "./modules/scheduled-lambda"

  lambda_image_uri     = "123456789012.dkr.ecr.us-west-2.amazonaws.com/my-lambda:latest"
  schedule_expression  = "rate(5 minutes)"
  sns_topic_arns = {
    task = aws_sns_topic.example_topic.arn
  }

  lambda_env = {
    LOG_LEVEL = "info"
  }
}
```

## Inputs

- `lambda_image_uri` (string): URI of the Lambda container image.
- `schedule_expression` (string): EventBridge schedule expression.
- `sns_topic_arns` (map(string)): Logical topic keys to SNS topic ARN mapping.
- `lambda_env` (map(string)): Additional environment variables for the Lambda.
- `timeout` (number): Lambda timeout in seconds.
- `memory_size` (number): Lambda memory size in MB.
- `lambda_name` (string): Optional name override for the Lambda.
- `image_command` (list(string)): Optional override for the container CMD/handler.
- `tags` (map(string)): Tags to apply to created resources.

## Outputs

- `lambda_arn`: ARN of the scheduled Lambda function.
- `execution_role_arn`: ARN of the Lambda execution role.
- `log_group_name`: CloudWatch log group name for the Lambda.
- `schedule_rule_name`: Name of the EventBridge schedule rule.
