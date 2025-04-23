terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 1.16.0" # Refer to docs for latest version
    }
  }
}

provider "auth0" {
    domain        = var.auth0_domain
    client_id     = var.auth0_client_id
    client_secret = var.auth0_client_secret
}

resource "auth0_resource_server" "employee_management_api" {
  name            = "EmployeeManagementAPI"
  identifier      = "EmployeeManagementAPI"
  token_lifetime = 86400
  skip_consent_for_verifiable_first_party_clients = true
}