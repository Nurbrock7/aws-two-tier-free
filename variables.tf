variable "aws_region" {
  description = "AWS region to deploy into. Pick one close to you; all resources here are Free Tier eligible."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name prefix applied to every resource."
  type        = string
  default     = "two-tier-free"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "EC2 instance type. t3.micro is Free Tier eligible (750 hrs/month)."
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "RDS instance class. db.t3.micro is Free Tier eligible (750 hrs/month, single-AZ)."
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Initial database name created inside the RDS instance."
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Master username for the database."
  type        = string
  default     = "appadmin"
}

variable "db_password" {
  description = "Master password for the database. Do NOT commit this. Set it via TF_VAR_db_password or a gitignored terraform.tfvars."
  type        = string
  sensitive   = true
}

variable "my_ip_cidr" {
  description = "Your public IP in CIDR form (e.g. 203.0.113.4/32) allowed to reach the load balancer. Use 0.0.0.0/0 to open to the world."
  type        = string
  default     = "0.0.0.0/0"
}
