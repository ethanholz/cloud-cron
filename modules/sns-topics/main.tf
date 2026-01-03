locals {
  tags = merge({ managed_by = "cloudcron" }, var.tags)
}

resource "aws_sns_topic" "topics" {
  for_each = var.topic_names

  name = each.value
  tags = local.tags
}
