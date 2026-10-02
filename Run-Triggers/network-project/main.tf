variable "public_ips" {
  type = list(string)
  default = [ "8.8.8.8", "1.1.1.1", "2.2.2.2", "8.8.4.4"]
}

resource "terraform_data" "network" {
  input = var.public_ips
}

output "public_ips" {
  description = "All public IP addresses defined in this workspace"
  value = var.public_ips
}