variable "region" {
  description = "AWS region to create the resources."
  type        = string
  default     = "us-east-1"
}

variable "server_name" {
  description = "Name of the EC2 instance to be created."
  type        = string
}

variable "server_size" {
  description = "Size of the server to be created. Acceptable values: small, medium, large."
  type        = string

  validation {
    condition     = contains(["small", "medium", "large"], var.server_size)
    error_message = "The server_size value must be one of the following: small, medium, large."
  }
}

variable "use_spot" {
  description = <<EOF
    Uses spot instance to run the server.
    This is not recommended since the server can be dropped at any time and all the server progress will be lost.
    Use this only if you want to run for a small period and to spend way less money.
  EOF
  type        = bool
  default     = false
}

variable "server_disk_size" {
  description = "Disk size of the server in GiB."
  type        = number
  default     = 50
}

variable "use_fixed_ip" {
  description = "Use a fixed IP to the server. Not using makes it more expensive when server is stoped."
  type        = bool
  default     = false
}
