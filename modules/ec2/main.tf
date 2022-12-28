
resource "aws_instance" "web" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name

  availability_zone = var.az
  subnet_id  = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.web.id]
  associate_public_ip_address = true
  user_data = "${file("init_web.sh")}"

  tags = {
    "Name" : "public WEB server"
  }
}

resource "aws_instance" "api" {
  ami               = var.ami
  instance_type     = var.instance_type
  key_name          = var.key_name

  availability_zone = var.az
  subnet_id  = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.web.id]
  associate_public_ip_address = true 
  user_data = "${file("init_api.sh")}"
  

 tags = {
    "Name" : "public API server"
  }
}
resource "aws_security_group" "web" {
  vpc_id = var.vpc_id
  name   = "Allow web"
  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "instance security group"
  }
}
