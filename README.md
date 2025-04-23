# Demo: Update Auth0 with Terraform and GitHub Actions

This repository contains Terraform configurations for managing Auth0 resources. It includes a GitHub Actions workflow to automate the application of Terraform changes to Auth0.

## Project Structure

- **`.github/workflows/terraform.yml`**: GitHub Actions workflow for automating Terraform operations.
- **`terraform/main.tf`**: Main Terraform configuration file defining the Auth0 provider and resources.
- **`terraform/variables.tf`**: Variables file for managing sensitive data like Auth0 domain, client ID, and client secret.
- **`terraform/.terraform.lock.hcl`**: Lock file to ensure consistent provider versions.

## Resources

### Terraform Resources
- **Auth0 Provider**: Configured in `main.tf` to manage Auth0 resources.
- **Auth0 API Resource**: Example resource defined in `main.tf` for managing an API named `EmployeeManagementAPI`.

## Prerequisites

- Terraform CLI (v1.5.6 or later)
- Auth0 account with appropriate credentials
- GitHub repository secrets for:
  - `AUTH0_DOMAIN`
  - `AUTH0_CLIENT_ID`
  - `AUTH0_CLIENT_SECRET`

---
## How to update API access token value in Auth0 using Postman
1. **Get an access token using an app (client) that is authorized to access Auth0 Management API**: Use Postman to send a POST request to the Auth0 token endpoint with your client credentials.
   - URL: `https://<your-auth0-domain>/oauth/token`
   - Method: `POST`
   - Headers: 
     - `Content-Type: application/json`
   - Body: 
     ```json
     {
       "client_id": "<your-client-id>",
       "client_secret": "<your-client-secret>",
       "audience": "https://<your-auth0-domain>/api/v2/",
       "grant_type": "client_credentials"
     }
     ```

     The response will include an `access_token` field. **Example** response:
      ```json
      {
         "access_token": "<your-access-token>",
         "expires_in": 86400,
         "scope": "read:resource_servers update:resource_servers",
         "token_type": "Bearer"
      }
      ```

2. **Use the Access Token to update token_lifetime**: Use the access token in the Authorization header to send a PATCH request to the Auth0 Management API.
   - Example API call:
     - URL: `https://<your-auth0-domain>/api/v2/resource-servers/<TARGET_API_IDENTIFIER>`
     - Method: `PATCH`
     - Headers:
     - `Content-Type: application/json`
     - `Authorization: Bearer <your-access-token>`
     - Body:
       ```json
       {
         "token_lifetime": <new-token-lifetime-value>
       }
       ```  
---
## Links:
- [Terraform / Auth0 / Getting started](https://registry.terraform.io/providers/auth0/auth0/latest/docs/guides/quickstart)