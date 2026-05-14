variable "instances" {
  description = "The number of EC2 instances to create."
  type        = list(string)
  default     = ["mongodb", "redis", "postgresql", "mysql"]
}