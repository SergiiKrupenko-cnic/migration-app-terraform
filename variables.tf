variable "region" {
  description = "region"
  type        = string
  default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"
}

variable "public_subnet" {
  description = "A list of public subnets inside the VPC"
  type        = string
  default     = ""
}

/*variable "private_subnet" {
  description = "A list of private subnets inside the VPC"
  type        = string
  default     = ""
}*/

variable "az" {
  description = "An availability zone"
  type        = string
  default     = ""
}
variable "ami" {
  description = "image ami"
  type        = string
  default     = ""
}
variable "instance_type" {
  description = "instance_type"
  type        = string
  default     = ""
}
variable "key_name" {
  type = string
  default = ""
}


variable "allowed_ports" {
  type    = list(string)
  default = []
}
