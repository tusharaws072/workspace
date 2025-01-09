variable "db_identifier" {
  description = "The database identifier for naming the SNS topic"

}


variable "sns_email" {
  description = "The email address for subscribing to the SNS topic"
  type = string
}

