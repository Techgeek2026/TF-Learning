
data "terraform_remote_state" "network" {
  backend = "remote"

  config = {
    organization = "MP-Lab"

    workspaces = {
      name = "network-project"
    }
  }
}


output "network_public_ips" {
  description = "List of public IPs fetched from the Network workspace"
  value = data.terraform_remote_state.network.outputs.public_ips
}