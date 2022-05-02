terraform {
    required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "~> 3.27"
      }
    }
    required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region = var.regiao_aws
}

resource "aws_key_pair" "ec2-key" {
  key_name = var.chave
  public_key = file("${var.chave}.pub")
  
  tags = {
    "Name" = "Conexão ssh"
  }
}

resource "aws_instance" "Ec2-Terraform" {
  ami = "ami-04505e74c0741db8d"
  instance_type = var.instancia
  key_name = var.chave
  tags = {
    Name = "Testando com ansible e terraform"
  }
  security_groups = [ "${aws_security_group.Ec2-prod.name}" ]
}