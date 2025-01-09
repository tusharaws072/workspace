variable "rds_cpu_alarm_name" {
  description = "Name of the CPU utilization alarm"
  type        = string
  default     = "rds-cpu-utilization-alarm"
}

variable "rds_cpu_alarm_description" {
  description = "Description of the CPU utilization alarm"
  type        = string
  default     = "Alarm when RDS MySQL CPU utilization exceeds the threshold"
}

variable "rds_cpu_evaluation_periods" {
  description = "Number of evaluation periods for the CPU utilization alarm"
  type        = number
  default     = 1
}

variable "rds_cpu_threshold" {
  description = "Threshold for CPU utilization"
  type        = number
  default     = 80
}

variable "rds_free_storage_alarm_name" {
  description = "Name of the free storage space alarm"
  type        = string
  default     = "rds-free-storage-space-alarm"
}

variable "rds_free_storage_alarm_description" {
  description = "Description of the free storage space alarm"
  type        = string
  default     = "Alarm when RDS MySQL free storage space drops below threshold"
}

variable "rds_free_storage_evaluation_periods" {
  description = "Number of evaluation periods for the free storage space alarm"
  type        = number
  default     = 1
}

variable "rds_free_storage_threshold" {
  description = "Threshold for free storage space (in bytes)"
  type        = number
  default     = 10000000000 # 10 GB
}

variable "rds_write_iops_alarm_name" {
  description = "Name of the high write IOPS alarm"
  type        = string
  default     = "rds-high-write-iops-alarm"
}

variable "rds_write_iops_alarm_description" {
  description = "Description of the high write IOPS alarm"
  type        = string
  default     = "Alarm when RDS MySQL Write IOPS exceeds the threshold"
}

variable "rds_write_iops_evaluation_periods" {
  description = "Number of evaluation periods for the write IOPS alarm"
  type        = number
  default     = 1
}

variable "rds_write_iops_threshold" {
  description = "Threshold for high write IOPS"
  type        = number
  default     = 1000000
}

variable "rds_alarm_period" {
  description = "Alarm evaluation period (in seconds)"
  type        = number
  default     = 300
}

variable "db_instance_identifier" {
  description = "The RDS instance identifier"
  type        = string
  default     = "demodb"
}



variable "alarm_actions" {
  description = "List of ARNs to trigger when an alarm state is triggered"
  type        = list(string)
  default     = [] # Set your default ARNs or leave empty
}

