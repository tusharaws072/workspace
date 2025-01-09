





output "vpc_id" {
  value = module.vpc.vpc_id
}


# output "sns_topic_arn" {
#   value       = module.sns.sns_topic_arn
#   description = "The ARN of the SNS topic for alarms"
# }
