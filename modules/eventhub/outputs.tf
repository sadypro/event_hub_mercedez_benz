output "namespace_id" {
  description = "Id of Event Hub Namespace."
  value       = azurerm_eventhub_namespace.mercedez_benz.id
}

output "log_analytics_workspace_id" {
  description = "Id of Log Aanlytics Workspace"
  value       = azurerm_log_analytics_workspace.mercedez_benz.id
}