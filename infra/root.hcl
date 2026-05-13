## Root Terragrunt configuration.
## Child terragrunt.hcl files include this to get a shared provider and a
## local backend whose state file lives next to the unit that owns it.

remote_state {
  backend = "local"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    path = "${get_terragrunt_dir()}/terraform.tfstate"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    provider "github" {
      owner = "andrewlidong"
      # token is read from the GITHUB_TOKEN environment variable.
      # Easiest setup: `export GITHUB_TOKEN=$(gh auth token)`
    }
  EOF
}
