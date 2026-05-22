resource "aws_security_group" "windows" {
  name        = "sandbox-windows-sg"
  description = "Windows EC2 security group managed by Terraform"
  vpc_id      = data.aws_vpc.sandbox.id

  ingress {
    description = "RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [var.rdp_cidr]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "sandbox-windows-sg"
    ManagedBy   = "terraform"
    Environment = "sandbox"
  }
}
