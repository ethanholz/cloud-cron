variable "topic_names" {
  description = "Map of topic keys to SNS topic names."
  type        = map(string)
}

variable "tags" {
  description = "Tags to apply to created topics."
  type        = map(string)
  default     = {}
}
