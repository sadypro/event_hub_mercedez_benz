# EventHub
This module deploys EventHub Namespace , Eventhub , and Diagnostic Setting

## What gets deployed
| Resource           | Description
| ---                | ---
| EventHub Namespace | An Envent hub namespace
| Eventhub     		 | An EventHub inside namespace to ingest envents
| Diagnostic Setting | Monitoring settings for the EventHub

## Notes: 
* Backend is assumed as local for simplicilty.
* Resource log_analytics_workspace is created additionally to support creation of azurerm_monitor_diagnostic_setting , as one of the one of eventhub_authorization_rule_id, log_analytics_workspace_id and storage_account_id is required for diagnostic setting to apply successfully. Refer :[monitor_diagnostic_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting)
* If we are want to use existing resource group instead of creating new one, then with little modification of resource group code we can introduce use of exisitng eventhub_authorization_rule_id, log_analytics_workspace_id and storage_account_id using a input variable.

Setup:
* [Install Terraform](https://www.terraform.io/intro/getting-started/install.html)
* Setup your credentials via [Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
* Clone this project
* Backend is assumed as local for simplicilty.

Run commands to deploy:
* ```export env=dev (or prod)```
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



