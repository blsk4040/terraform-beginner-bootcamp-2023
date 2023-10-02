# Terraform Beginner Bootcamp 2023 - Week 1


## Root Module Structure

Our root module structure is as follow:

```
  PROJECT_ROOT
  |
  |-- main.tf              # everything else.
  |-- variable.tf          # stores the structure of input variable
  |-- terraform.tfvars     # the data of variables we want to load into our Terraform
  |-- providers.tf         # define required providers and their configuration
  |-- outputs.tf           # stores our outputs
  |__ README.md            # required for root modules

``` 
[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform Input Variables

### Terraform Cloud Variables

In terraform we can set two kind of variables:
- Environment Variables - those that you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file

Terrafrom Cloud variables can be set to be sensetive so that they are not shown visibily in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables ](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag

We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_ud="my-user_id"`

### var-file flag

- HOMEWORK RESEARCH

### terraform.tvfars
This is the default file to load in terraform variables in blunk

### auto.tfvars
- NEED TO RESERCH AND DOCUMENT THE FINDINGS

### order of terraform variables

-TODO: document which terraform variable takes presendce.

