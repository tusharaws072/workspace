module "rds_cpu_utilization_alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version = "~> 3.0"

  alarm_name          = var.rds_cpu_alarm_name
  alarm_description   = var.rds_cpu_alarm_description
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.rds_cpu_evaluation_periods
  threshold           = var.rds_cpu_threshold
  period              = var.rds_alarm_period
  unit                = "Percent"
  namespace           = "AWS/RDS"
  metric_name         = "CPUUtilization"
  statistic           = "Average"

  dimensions = {
    DBInstanceIdentifier = var.db_instance_identifier
  }
  alarm_actions = var.alarm_actions
}

module "rds_free_storage_space_alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version = "~> 3.0"

  alarm_name          = var.rds_free_storage_alarm_name
  alarm_description   = var.rds_free_storage_alarm_description
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.rds_free_storage_evaluation_periods
  threshold           = var.rds_free_storage_threshold
  period              = var.rds_alarm_period
  unit                = "Bytes"
  namespace           = "AWS/RDS"
  metric_name         = "FreeStorageSpace"
  statistic           = "Average"

  dimensions = {
    DBInstanceIdentifier = var.db_instance_identifier
  }
  alarm_actions = var.alarm_actions
}

module "rds_high_write_iops_alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version = "~> 3.0"

  alarm_name          = var.rds_write_iops_alarm_name
  alarm_description   = var.rds_write_iops_alarm_description
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.rds_write_iops_evaluation_periods
  threshold           = var.rds_write_iops_threshold
  period              = var.rds_alarm_period
  unit                = "Count/Second"
  namespace           = "AWS/RDS"
  metric_name         = "WriteIOPS"
  statistic           = "Average"

  dimensions = {
    DBInstanceIdentifier = var.db_instance_identifier
  }
  alarm_actions = var.alarm_actions
}

