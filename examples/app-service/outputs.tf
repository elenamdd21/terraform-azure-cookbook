output "web_app_url" {
  value = "https://${module.web_app.default_hostname}"
}
output "web_app_principal_id" {
  value = module.web_app.principal_id
}
output "log_analytics_workspace_id" {
  value = module.workspace.id
}
