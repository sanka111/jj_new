#variables for efs
variable "efs_name" {
  description = "efs displayed name"
  type = string
  default = "wowmall-prod-efs"
}

variable "efs_performanceMode" {
  description = "efs performance mode (general purpose or Max I/O)"
  type = string
  default = "generalPurpose"
}

variable "efs_throughputMode" {
  description = "efs throughput mode (bursting or provisioned)"
  type = string
  default = "bursting"
}

variable "efs_transitionToIa" {
  description = "efs lifecycle policy setting that specifies when files should be transitioned to the Infrequent Access (IA) storage class"
  type = string
  default = "AFTER_30_DAYS"
}

#Variabe to get VPC ID from VPC Module
variable "vpc_id" {
  type = string
}

variable "core_subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
}

#Common Tags
variable "common_tags" {
  type = map(string)
}