variable "auth0_domain" {
    description = "Auth0 domain (e.g., your-tenant.auth0.com)"
    type        = string  
}

variable "auth0_client_id" {
    description = "Auth0 client ID"
    type        = string
    sensitive   = true
  
}

variable "auth0_client_secret" {
    description = "Auth0 client secret"
    type        = string 
    sensitive   = true
}

variable "api_access_token_lifetime" {
    description = "API access token lifetime"
    type        = number  
    default     = 86400 # 24 hours
}

# TODO: Consider removing the default values for `resource_api_name` 
# and `resource_api_identifier` if they are environment-specific. 
# This ensures explicit configuration for each environment.
variable "resource_api_name" {
    description = "API name"
    type        = string  
    default     = "EmployeeManagementAPI"
}

variable "resource_api_identifier" {
    description = "API identifier"
    type        = string  
    default     = "EmployeeManagementAPI"
}