

variable "owner" {
  description = "The account owner"
  type        = string
}

variable "entity" {
  description = "Work entity"
  type        = string
}

variable "ephemere_oui" {
  description = "Removal of resources at 22h"
  type        = string
}

variable "ephemere_non" {
  description = "Stopping all resources at 22h"
  type        = string
}

variable "cidr_vpc" {
  description = "VPC's cidr"
  type        = string
}

variable "cidr_public_subnet" {
  description = "Public subnet's cidr"
  type        = string
}

variable "cidr_private_subnet" {
  description = "Private subnet's cidr"
  type        = string
}

variable "ec2_type" {
  description = "The instance type"
  type        = string
}

variable "bastion_key" {
  description = "The instance type"
  type        = string
}

