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

/*
==============================================================================
The purpose of this excercise is to understand and resolve a challenge with
remote-state. 

remote-state allows security-project to read the IPs from the tfstate. However,
the challenge is that after a change is made to network-project, the 
secuirty-project must be notified so they can trigger a run.  

We have overcome this challeng by applying the following:

1) On HCP Terraform in network-project workspace, click settings -> General and 
add security-project under "Remote State Sharing".  This allows the state to be
shared between network-project and security-project workspace.

2) On HCP Terraform in network-project workspace, click settings -> Run Triggers
select "Auto-apply run triggers". Then under "Connected workspace", click
"connect workspace" and add network-project.
==============================================================================
*/

/*
============================================================================== 
For Terraform Enterprise use the below which is more secure because it does not
Require full access to workspace state to fetch outputs
===============================================================================

data "tfe_outputs" "networking" {
  organization = "my-org-name"
  workspace    = "networking-prod"
}

output "vpc_id" {
  value = data.tfe_outputs.networking.values.vpc_id
}

*/