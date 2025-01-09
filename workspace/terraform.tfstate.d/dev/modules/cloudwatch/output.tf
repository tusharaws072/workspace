output "rds_cpu_utilization_alarm_name" {
  description = "Name of the CPU utilization alarm"
  value       = var.rds_cpu_alarm_name
}

output "rds_free_storage_alarm_name" {
  description = "Name of the free storage space alarm"
  value       = var.rds_free_storage_alarm_name
}

output "rds_write_iops_alarm_name" {
  description = "Name of the high write IOPS alarm"
  value       = var.rds_write_iops_alarm_name
}



output "rds_alarm_actions" {
  description = "The actions attached to the RDS alarms"
  value       = var.alarm_actions
}