# Demo: Update Auth0 with Terraform and GitHub Actions

This repository contains Terraform configurations for managing Auth0 resources. It includes a GitHub Actions workflow to automate the application of Terraform changes to Auth0.

## Prerequisites

- Terraform CLI (v1.5.6 or later)
- Auth0 account with appropriate credentials
- GitHub repository secrets for:
  - `AUTH0_DOMAIN`
  - `AUTH0_CLIENT_ID`
  - `AUTH0_CLIENT_SECRET`

---
## Summary of the process for updating the access token's lifetime:

1. **GitHub Actions Workflow**: The process is automated through a GitHub Actions workflow defined in `.github/workflows/terraform.yml`.
2. **Terraform Configuration**: The workflow uses Terraform to manage Auth0 resources. The Terraform configuration is defined in `terraform/main.tf`.
3. **Auth0 Provider**: The Terraform configuration uses the Auth0 provider to interact with the Auth0 API.
4. **Resource Server**: The Terraform configuration defines an Auth0 resource server (`auth0_resource_server.employee_management_api`) with a `token_lifetime` attribute.
5. **Variable Definition**: The `token_lifetime` attribute is defined as a variable (`api_access_token_lifetime`) in `terraform/variables.tf`.
6. **Default Value**: The variable has a default value of 86400 (24 hours), but it can be overridden.
7. **Workflow Steps**: The GitHub Actions workflow performs the following steps:
	* Initializes Terraform
	* Validates the Terraform configuration
	* Imports existing resources (assuming the resource already exists)
	* Plans the Terraform changes
	* Applies the Terraform changes
8. **Updating the Token Lifetime**: To update the access token's lifetime, you need to update the value of the `api_access_token_lifetime` variable in `terraform/variables.tf`.
9. **Triggering the Workflow**: The workflow is triggered on push events to the `main` branch, and it ignores changes to the `README.md` file.

To update the access token's lifetime, you would:

* Update the value of the `api_access_token_lifetime` variable in `terraform/variables.tf`.
* Commit and push the changes to the `main` branch.
* The GitHub Actions workflow will automatically trigger and apply the changes to the Auth0 resource server.

Note that the workflow assumes the resource already exists. If this is not always the case, you may need to add a conditional check to the workflow.

---
## How to update API access token value in Auth0 using Postman
1. **Get an access token using an app (client) that is authorized to access Auth0 Management API**: Use Postman to send a POST request to the `/oauth/token` with your client credentials.
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

2. **Use the Access Token to update token_lifetime**: Use the access token to send a PATCH request to `/api/v2/resource-servers/:id`.
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