variable "public_subnet_id" {
  description = "A  public subnet id inside the VPC"
  type        = string
  default     = ""
}

variable "private_subnet_id" {
  description = "A  private subnet id inside the VPC"
  type        = string
  default     = ""
}

/*variable "nat_eip_id" {
  description = "A list of EIP IDs"
  type        = list(string)
  default     = []
}*/
variable "vpc_id" {
  type    = string
  default = ""
}
variable "aws_ami" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = ""
}

variable "allowed_ports" {
  type    = list(string)
  default = []
}

variable "key_name" {
  type = string
  default = ""
}
variable "az" {
  description = "A list of availability zones names or ids in the region"
  type        = string
  default     = ""
}
variable "ami" {
  description = "image ami"
  type        = string
  default     = ""
}
