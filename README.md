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
## Links:
- [Terraform / Auth0 / Getting started](https://registry.terraform.io/providers/auth0/auth0/latest/docs/guides/quickstart)