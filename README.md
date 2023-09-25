# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to utilize semantic versioning for its tagging.
[semver.org](https://semver.org/)

The general format:

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI

### Considerations with the Terrafrom CLI changes

The Terraform CLI installation instructions have chnanged due to gpg keyring changes. So we need to refer to the latest install CLI instructions via Terraform Documentation and chnage the scripting for install.


[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Consideration for Linux Distribution

This project is built against Ubuntu.
Please consider checking your Linux Distribution and update accordily.

[How To Check OS Version in Linux]
(https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

```
- Command : cat /etc/os-release
```

- 0utput :

```
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```


### Refactoring into Bash Scripts 

While fixing the Terraform CLI gpg depreciation issues we noticed the installation steps has alot of code so we updated to make a bash script to install Terraform CLI.

This bash script is located here:[./bin/install_terraform_cli](./bin/install_terraform_cli)

- This will keep the Gitpod Task File ([.gitpod.yml](.gitpod.yml))tidy.
- This allow us an easire to debug and execute manually Terraform CLI install.
- This will allow better portability for ther projects that need to install Terraform CLI.


### Shebang Condisderations
A Shebang tells the bash script what program will interpet the script. eg.`#!/bin/bash`

ChatGPT recommendation for bash: `#!/usr/bin/env bash`
- for portability for different OS distrubtions
- will search the user's PATH for the bash executable

## Execution Considerations 
When executing the bash script we can use the `/` shorthand notation to execute the bash script.

eg. `./bin/install_terraform_cli`

Use this script in .gitpod.yml, we need to point the script to a program to interpret it.

eg. `source ./bin/install_terraform_cli`

https://en.wikipedia.org/wiki/Shebang_(Unix)

### Linux Permissions Considerations

In order to make our bash script executable we need to change linux permission for the fix to be executable at the user mode.

```sh
chmod u+x ./bin/install_terraform_cli
```

Alternatively

```sh
chmod 744 ./bin/install_terraform_cli
```

### Github Lifecycle (Before, Init, Command)

We need to be carefule when using the Init because it will not return if we start an existing workspace.

https://en.wikipedia.org/wiki/Chmod
https://www.gitpod.io/docs/configure/workspaces/tasks


### Working Env Vars 

### env command

We can list all Environment variables (Env Vars) using the `env` command

We can filter specific env vars using grep eg. `env | grep AWS`

#### Setting and Unsetting Env Vars
In the terminal we can set using `export HELLO=`world`

In the terminal we unset using `unset HELLO`

We can set an env temporarily when just running a command

```sh
HELLO='world' ./bin/print_message
```
Within a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```
#### Printing Vars

We can print an env var using echo eg. 'echo $HELLO'

#### Scoping of Env vars

When you open up new bash terminal in VScode it will not be aware of env vars that you set in another window.

If you want to Env vars to work accross all future bash terminals that are open you need to set env vars in your bash profile. eg. `bash_profile`

#### Persisting Env Vars in Gitpod

We can persist en vars into gitpod by storing themin Gitpod Secret Storage.

```
gp env HELLO='world'
```

All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.

You can also set en vars in the `.gitpod.yml` but this can only contain non-senstive env vars.

### AWS CLI Installation for this project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[Getting Started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

By using this to check if our AWS credentials is configured correctly by running the command below.

AWS CLI Command:

```sh
aws sts get-caller-identity
```


If it is successful you should see a json payload return that looks like this :

### Remeber the details below have been updated due to security reasons.Not the same as what is in the AWS Console.

```json
{
    "UserId": "AIDAU9SDK728YLAS1IKMY",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-beginner-bootcamp"
}
```

We'll need to generate AWS CLI credentials from IAM User in other to use the AWS CLI .


## Terraform Basics 

### Terraform Registry

Terraform sources their providers and modules from the Terrafrom registry which is located at the [registry terrafrom.io](https://registry.terraform.io/)

- **Providers** is an interface to APIs that allow users to create resources in terraform.
- **Modules** are ways to make a larger amoutn of terrafrom code modular, protable and sharable.

[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random)

### Terraform Console

We can see a list of all the Terrafrom commands by simply typing `terraform`

#### Terraform Init

At the start of a new terrafrom project use the `terrafrom init` to download the binaries from a terraform provider that we'll use in this project.

#### Terraform Plan

`terraform plan`

This will generate out a changeset, about the state of our infracture and what will be chnaged .

We can output this chnageset ie. "Plan" to be passed to an apply, but often you can just ignore outputting.

#### Terraform Apply 

`terraform apply`

This will run a plan and pass the chnageset to be excuted by terraform. Apply should prompt us with a `yes` or `no` .

If we want to automate the `yes` we can apply this by this command `terraform apply --auto-approve` .

### Terrafrom Lock Files

`.terraform.lock.hcl` contains the locked versioning for the provider or modulues that should be used with this project.

The Terraform Lock File **should be commited** to your version control System (VSC) eg. Github


### Terraform State Files

`.terraform.tfstate` contain information about the current state of the infrastructure.

This file **should not be commited** to your VCS .
`VCS`  **Stands for VERSION CONTROL SYSTEM**

This file can sensentve data. Should you loose the file , you loose knowing the state of your infrastructure.

`.terraform.tfstate.backup` is the previous state file state.

### Terraform Directory

`.terraform` directory contains binaries of terraform providers.



