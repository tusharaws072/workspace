


resource "aws_sns_topic" "alarm_notifications" {
  name = "${var.db_identifier}-alarm-topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alarm_notifications.arn
  protocol  = "email"
  endpoint  = var.sns_email
}