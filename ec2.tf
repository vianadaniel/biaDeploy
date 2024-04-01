resource "aws_instance" "amb-prod" {
  ami             = "ami-0c7217cdde317cfec"
  instance_type   = "t2.micro"
  key_name        = "Terraform"
  security_groups = ["allow_ssh", "allow_web", "allow_egress", "allow_node"]
  tags = {
    Name = "amb-prod"
  }
}
