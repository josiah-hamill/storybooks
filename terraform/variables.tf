### GENERAL
variable "app_name" {
  type = string
}

### ATLAS
# variable "atlas_project_id" {
#   type = string
# }

variable "atlas_strategix_owner_id" {
  type = string
}

variable "atlas_strategix_public_key" {
  type = string
}

variable "atlas_strategix_private_key" {
  type = string
}

variable "atlas_user_password" {
  type = string
}

### GCP
variable "gcp_machine_type" {
  type = string
}

### Cloudflare
variable "cloudflare_api_token" {
  type = string
}

variable "domain" {
  type = string
}