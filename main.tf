terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
  backend "s3" {
    bucket = "bahms-money"
    key    = "aws/bahms-money/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

data "template_file" "alpha-wordpress" {
  template = file("wordpress.tpl")
  vars = {
    db   = var.db
    user = var.user
    pass = var.pass
    theme = var.theme
  }
}

# # Data source declaration for all necessary fetch
# data "aws_vpc" "default_vpc" {
#   default = true
# }

# data "aws_subnets" "subnets" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.default_vpc.id]
#   }
# }

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "wordpress" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "my-keypair"
  user_data = data.template_file.alpha-wordpress.rendered
  tags = {
    Name = "wordpress"
  }
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.wordpress.public_ip
}
