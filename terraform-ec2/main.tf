terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    aap = {
      source = "ansible/aap"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  # Optional: security groups if you want to pass them in
  # vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = var.instance_name
  }
}

output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

provider "aap" {
  host     = "https://controller"
  username = "admin"
  password = var.aap_passwd
  insecure_skip_verify = true
}