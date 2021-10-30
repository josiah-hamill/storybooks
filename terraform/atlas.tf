provider "mongodbatlas" {
  public_key = "${var.atlas_public_key}"
  private_key = "${var.atlas_private_key}"
}

# CLUSTER
resource "mongodbatlas_cluster" "mongo_cluster" {
  project_id = var.atlas_project_id
  name = "${var.app_name}-${terraform.workspace}"

  # Provider Settings "block"
  provider_name = "TENANT"
  backing_provider_name = "GCP"
  provider_region_name = "CENTRAL_US"
  provider_instance_size_name = "M0"
}

# DB USER
resource "mongodbatlas_database_user" "mongo_user" {
  username           = "storybooks-user-${terraform.workspace}"
  password           = var.atlas_user_password
  project_id         = var.atlas_project_id
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = "storybooks"
  }
}

# IP WHITELIST
resource "mongodbatlas_project_ip_access_list" "test" {
  project_id = var.atlas_project_id
  ip_address = google_compute_address.ip_address.address
}