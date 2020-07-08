
variable "from_vpc" {
  description = "vpc id to peer from; route table entries will be set here, pointing at to_vpc"
}

variable "to_vpc" {
  description = "vpc id to peer to; no routes set in this vpc"
}
