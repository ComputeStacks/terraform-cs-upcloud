NOTE: UpCloud has not yet released a debian 11 (bullseye) image. Until then, please manually upgrade the created debian 10 virtual machines to debian 11 prior to running our ansible installation process.

# Deploying ComputeStacks on UpCloud

Create a `terraform.tfvars` file and adjust the settings appropriately. Specifically, you will:

* Choose the appropriate package for your servers
  * _NOTE:_ The packages set as the default in the `terraform.tfvars.sample` meet our minimum requirements. We do not recommend going below those, as that may prevent ComputeStacks from booting.
* Specify how many nodes you want (we recommend 1, 3, or 5). If you need more resources, consider increasing the plan size, or creating multiple availability zones.
* Choose your region

## Setup Terraform

Before proceeding, ensure you have [terraform installed](https://learn.hashicorp.com/tutorials/terraform/install-cli), and then run:

```bash
terraform init
```

## Running Terraform

```bash
terraform apply
```

After terraform runs, you will see 2 newly created files under the `result/` directory.

1. `dns_settings.txt` | Your DNS settings, which must be applied prior to running the ansible package.
2. `inventory.yml` | You will need this later when configuring Ansible.

## Before Running Ansible

During the initial boot process of your new droplets, ansible will be installed. This can take a few minutes to complete. 

Please ensure that this process has completed _before_ running the ansible package. You can verify that this is completed by running: `tail -f /var/log/syslog`

You can also confirm the process has completed by ensuring `which ansible` is successful.

## API Notes

Use these to determine values for the terraform configuration file.

* Available plans: `curl -u $UPCLOUD_USERNAME:$UPCLOUD_PASSWORD https://api.upcloud.com/1.3/plan`
* Available templates: `curl -u $UPCLOUD_USERNAME:$UPCLOUD_PASSWORD https://api.upcloud.com/1.3/storage/template`
* Available Zones: `curl -u $UPCLOUD_USERNAME:$UPCLOUD_PASSWORD https://api.upcloud.com/1.3/zone`

### Tip: Direnv

You can use [direnv](https://direnv.net/) to safely store environmental variables locally in this directory. 
Once [direnv](https://direnv.net/) is installed: 

  1) `mv .envrc.sample .envrc`
  2) add your upcloud credentials, and;
  3) `direnv allow .`. 
