variable "public_ips" {
  type = list(string)
  default = [ "8.8.8.8", "1.1.1.1" ]
}

output "public_ips" {
  description = "All public IP addresses defined in this workspace"
  value = var.public_ips
}