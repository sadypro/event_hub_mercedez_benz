# EventHub
This module deploys EventHub Namespace , Eventhub , and Diagnostic Setting

## What gets deployed
| Resource           | Description
| ---                | ---
| EventHub Namespace | An Envent Hub Namespace
| Eventhub     		 | An event HUb inside namespace to ingest envents
| Diagnostic Setting | Monitoring Settings for the EventHub


Setup:
* [Install Terraform](https://www.terraform.io/intro/getting-started/install.html)
* Setup your credentials via [Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
* Clone this project
* Backend is assumed as local for simplicilty.

Run commands to deploy:
* ```export env=dev (or prod)```
* ```terraform get -update=true```
* ```terraform init ```
* ```terraform apply -var-file=config/${env}.tfvars```


## Configuration files
There are two example configuration files in the ```config/``` folder.  Each contains inputs for the main terraform module to run.
 * dev: for  development environment settings
 * prod: for  production like environment settings


## Inputs

| Name                	     | Description                                           | Type   | Default | Required |
| ------              	     | -------------                                         | :----: | :-----: | :-----:  |
| region   			  	     | Region where resource to be deployed| string 		 | -      | yes     | yes      |
| resource_group_name        | Resource Group Name                                   | string | -       | yes      |
| eventhub_namespace_name    | Name of EventHub NameSpace                            | string | -       | yes      |
| sku                        | Defines Machine Tier.  Options are Basic and Standard | -      | yes     | yes      |
| namespace_capacity         | Specifies the Capacity range from 1 - 40			     | number | 1       | yes      |
| enviornment_name           | Environment Name									     | string | -       | yes      |
| eventhub_name              | Name of EventHub                                      | string | -       | yes      |
| eventhub_partition_count   | Partition Count									     | string | -       | yes      |
| eventhub_message_retention | Message Rention singla								 | string | -       | yes      |
| auto_inflate 			     | Auto Inflate Check and Maximum Throughput             | object | null    | No       |
| diagnostics 				 | Diagnostic settings                                   | object | null    | No       |

## Outputs

| Name         				 | Description   				 |
| ------       				 | --------------------------  	 |
| namespace_id 				 | Id of Event Hub Namespace.  	 |
| log_analytics_workspace_id | Id of Log Aanlytics Workspace |



