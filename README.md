# terraform-aws-template

## Workflow features
- Authenticating via [Assume a Role](https://github.com/aws-actions/configure-aws-credentials#sample-iam-role-cloudformation-template)
- [plan.yml](.github/workflows/plan.yml)
    - Run `terraform plan`
        - Automatically run when a pull request is issued to the main branch
    - Comment the results of the `terraform plan` in the pull request
    - Run `terraform plan`, `terraform fmt` and [tflint](https://github.com/terraform-linters/tflint)
- [apply.yml](.github/workflows/apply.yml)
    - Run `terraform apply`

## Requirements
* GitHub Actions
* Terraform v1.0+

## Usage
### 1. Install tools
* [tfenv](https://github.com/tfutils/tfenv)

### 2. Use This template

### 3. Setup for CloudFormation
* setup file `CloudFormation/setup-terraform.yml`
* start [CloudFormation](https://console.aws.amazon.com/console/home)

#### Parameters
* `BackendBucketName` **(Required)**
  * Name of backend bucket.
  * c.f. https://www.terraform.io/language/settings/backends/s3
* `GitHubOrgName` **(Required)**
  * GitHub organization or user name
* `GitHubRepositoryName` **(Required)**
  * GitHub repository name
* `OIDCProviderArn` (optional)
  * Arn for the GitHub OIDC Provider.
  * A new provider will be created if omitted

### 5. Edit file for Terraform
#### [terraform.tfvars](terraform.tfvars)
Please check [variable.tf](variable.tf) discription

#### [version.tf](version.tf)
Upgrade to the latest version
- `terraform.required_version`

#### [backend.tf](backend.tf)
backet is Same to BackendBucketName

### 6. Edit file for GitHub Actions
#### [.github/workflows/plan.yml](.github/workflows/plan.yml)
#### [.github/workflows/apply.yml](.github/workflows/apply.yml)
Edit followings

* `TERRAFORM_VERSION`
  * Same to [.terraform-version](.terraform-version)
* `AWS_ROLE_ARN`
  * This is created by CloudFormation
* `AWS_REGION`
  * This is CloudFormation Region

### 7. Check git push repository
`git push` and check your repository