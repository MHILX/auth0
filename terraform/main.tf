terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 1.16.0"
    }
  }
}

provider "auth0" {
  domain        = var.auth0_domain
  client_id     = var.auth0_client_id
  client_secret = var.auth0_client_secret
}

resource "auth0_resource_server" "employee_management_api" {
  name                                            = var.resource_api_name
  identifier                                      = var.resource_api_identifier
  token_lifetime                                  = var.api_access_token_lifetime
  skip_consent_for_verifiable_first_party_clients = true
}