variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be created"
  type        = string
}

variable "key_name" {
  description = "Name of an existing EC2 Key Pair"
  type        = string
}

variable "aap_passwd" {
  description = "AAP admin password"
  type        = string
  sensitive   = true
}

variable "instance_name" {
  description = "Tag: Name"
  type        = string
}

# Uncomment if you want to pass SGs via tfvars
variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = []
}
