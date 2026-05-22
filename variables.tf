variable "aws_region" {
  description = "AWS region for the EC2 instance."
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type for the Windows server."
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "Windows AMI ID to use for the instance."
  type        = string
  default     = "ami-0b5eea76982371e91"
}

variable "key_pair_name" {
  description = "Existing AWS EC2 key pair name used for RDP access."
  type        = string
}

variable "rdp_cidr" {
  description = "CIDR block allowed to access RDP."
  type        = string
  default     = "203.0.113.42/32"
}
