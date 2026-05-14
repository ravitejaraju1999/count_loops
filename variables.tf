variable "instances" {
  description = "The number of EC2 instances to create."
  type        = list(string)
  default     = ["mongodb", "redis", "postgresql", "mysql"]
}

variable "zone_id" {
  description = "The ID of the Route 53 hosted zone where the record will be created."
  type        = string
  default     = "Z09554163BEIVGQB3DW1S"
}

variable "domain_name" {
  description = "The domain name for the Route 53 record."
  type        = string
  default     = "raviteja.store"
}