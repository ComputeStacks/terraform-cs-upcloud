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

## Complete Your Cluster

Once the process is completed, you will find an `inventory.yml` file in this directory. This will be filled in with the servers that were just created, as well as a few other things like new random passwords.

However, you will still need to update all the other variables, such as:
* License Key
* Domain Names
* Your company / brand identification

## API Notes

Use these to determine values for the terraform configuration file.

* Available templates: `curl -u $UPCLOUD_USERNAME:$UPCLOUD_PASSWORD https://api.upcloud.com/1.3/storage/template`
* Available Zones: `curl -u $UPCLOUD_USERNAME:$UPCLOUD_PASSWORD https://api.upcloud.com/1.3/zone`
