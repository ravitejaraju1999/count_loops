resource "aws_instance" "var.instances[count.index]" {
    count = 4
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.terraform_all.id]

    tags ={
        Name = var.instances[count.index]
        Terraform = "true"
    }

}




resource "aws_security_group" "terraform_all" {
  name        = "terraform-all"
  description = "Security group for EC2"

  # Inbound Rule (Ingress)
  ingress {
    description = "Allow SSH" 
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #
    cidr_blocks = ["0.0.0.0/0"]
  }


  # Outbound Rule (Egress)
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0 # from port 0 to port 0 means all ports
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] # allow all outbound traffic to any destination
  }

  tags = {
    Name = "terraform-all"
  }
}

