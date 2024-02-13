locals {
  environment = basename(get_terragrunt_dir()) # use environment folder as environment
  # environment_vars = jsondecode(sops_decrypt_file("${get_parent_terragrunt_dir()}/${path_relative_to_include()}/params.json"))
  environment_vars = jsondecode(file("${path_relative_to_include()}/params.json"))
}

terraform {
  source = "../../terraform"
}

inputs = merge (
  local.environment_vars,
  local
)