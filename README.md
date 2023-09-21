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