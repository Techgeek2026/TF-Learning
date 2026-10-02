
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
For Terraform Enterprise use the below which is more secure
===============================================================================

data "tfe_outputs" "networking" {
  organization = "my-org-name"
  workspace    = "networking-prod"
}

output "vpc_id" {
  value = data.tfe_outputs.networking.values.vpc_id
}

*/