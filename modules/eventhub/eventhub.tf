resource "azurerm_resource_group" "mercedez_benz" {
  name     = "${var.resource_group_name}"
  location = "${var.region}"
  
  tags = var.tags
}

resource "azurerm_eventhub_namespace" "mercedez_benz" {
  name                = join("-",[var.eventhub_namespace_name, var.enviornment_name, "ns"])
  location            = azurerm_resource_group.mercedez_benz.location
  resource_group_name = azurerm_resource_group.mercedez_benz.name
  sku                 = "${var.sku}"
  capacity            = "${var.namespace_capacity}"

  auto_inflate_enabled     = var.auto_inflate != null ? var.auto_inflate.enabled : null
  maximum_throughput_units = var.auto_inflate != null ? var.auto_inflate.maximum_throughput_units : null

  dynamic "network_rulesets" {
    for_each = var.network_rules != null ? ["true"] : []
    content {
      default_action = "Deny"

      dynamic "ip_rule" {
        for_each = var.network_rules.ip_rules
        iterator = iprule
        content {
          ip_mask = iprule.value
        }
      }

      dynamic "virtual_network_rule" {
        for_each = var.network_rules.subnet_ids
        iterator = subnet
        content {
          subnet_id = subnet.value
        }
      }
    }
  }
    
  tags = var.tags
}

resource "azurerm_eventhub" "mercedez_benz" {
  name                = "${var.eventhub_name}"
  namespace_name      = azurerm_eventhub_namespace.mercedez_benz.name
  resource_group_name = azurerm_resource_group.mercedez_benz.name
  partition_count     = "${var.eventhub_partition_count}"
  message_retention   = "${var.eventhub_message_retention}"
}


resource "azurerm_storage_account" "mercedez_benz" {
  name                     = "storageaccountmbz"
  resource_group_name      = azurerm_resource_group.mercedez_benz.name
  location                 = azurerm_resource_group.mercedez_benz.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_log_analytics_workspace" "mercedez_benz" {
  name                = "log-analytics-workspace"
  location            = azurerm_resource_group.mercedez_benz.location
  resource_group_name = azurerm_resource_group.mercedez_benz.name
  retention_in_days   = 30

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "mercedez_benz" {
  name               = "mercedez_benz"
  target_resource_id = azurerm_eventhub_namespace.mercedez_benz.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.mercedez_benz.id

  log {
    category = "OperationalLogs"

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}