data "template_file" "monitoring_json" {
  for_each = fileset(path.module, local.datadog_json_filter)
  template = file("${path.module}/${each.key}")
  /* vars = {
    env               = var.query_env,
    critical          = var.thresholds_critical
    warning           = var.thresholds_warning
    critical_recovery = var.threshold_critial_recovery
    warning_recovery  = var.threshold_warning_recovery
    renotify          = var.renotify_interval
    escalation        = var.escalation_message
  } */
}

resource "datadog_monitor_json" "monitor" {
  for_each = data.template_file.monitoring_json
  monitor  = data.template_file.monitoring_json[each.key].rendered
}
