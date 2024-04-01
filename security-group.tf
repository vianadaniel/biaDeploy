resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh 22 inbound traffic and all outbound traffic"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow web 80 inbound traffic and all outbound traffic"

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web"
  }
}

resource "aws_security_group" "allow_egress" {
  name        = "allow_egress"
  description = "Allow egress traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_egress"
  }
}

resource "aws_security_group" "allow_node" {
  name        = "allow_node"
  description = "Allow Node.js 3000 inbound traffic and all outbound traffic"

  ingress {
    description = "Node.js from VPC"
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_node"
  }
}
