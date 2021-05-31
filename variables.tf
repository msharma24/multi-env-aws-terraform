variable "region" {
  description = "AWS Region"
  type        = string

}

variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type        = string

}



variable "private_subnets" {
  description = "List of Private Subnet CIDRs"
  type        = list(any)

}

variable "public_subnets" {
  description = "List of Public Subnet CIDRs"
  type        = list(any)

}
