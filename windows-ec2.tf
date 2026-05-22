resource "aws_instance" "windows" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.windows.id]
  key_name               = var.key_pair_name

  associate_public_ip_address = true

  user_data = <<-EOF
<powershell>
Install-WindowsFeature -Name Web-Server -IncludeManagementTools
New-Item -ItemType File -Path C:\inetpub\wwwroot\index.html -Value "<h1>Hello from Terraform Windows EC2!</h1>"
</powershell>
EOF

  tags = {
    Name        = "sandbox-windows-ec2-terraform"
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}
