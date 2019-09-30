# default type of terraform variables
variable "project" {
  # can be omitted
  type = string
}

variable "credentials_file" {}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "web_instance_count" {
  type = number
  # values can be integer or floating point
  default = 1
}

variable "cidrs" {
  # explicitly declare type	
  type = list
  # implicitly declare type
  default = []
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "machine_types" {
  type = "map"
}
