output "topic_arns" {
  description = "Map of topic keys to SNS topic ARNs."
  value       = { for key, topic in aws_sns_topic.topics : key => topic.arn }
}

output "topic_names" {
  description = "Map of topic keys to SNS topic names."
  value       = { for key, topic in aws_sns_topic.topics : key => topic.name }
}

output "topics_json" {
  description = "JSON-encoded map of topic keys to SNS topic ARNs."
  value       = jsonencode({ for key, topic in aws_sns_topic.topics : key => topic.arn })
}
