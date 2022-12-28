variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"
}

variable "public_subnet" {
  description = "A public subnet inside the VPC"
  type        = string
  default     = ""
}

variable "az" {
  description = "A list of availability zones names or ids in the region"
  type        = string
  default     = ""
}
variable "public_subnet_id" {
  description = "A  public subnet id inside the VPC"
  type        = string
  default     = ""
}

/*variable "private_subnet_id" {
  description = "A private subnet id inside the VPC"
  type        = string
  default     = ""
}
variable "private_subnet" {
  description = "A  private subnet inside the VPC"
  type        = string
  default     = ""
}*/