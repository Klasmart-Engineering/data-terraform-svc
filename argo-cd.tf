resource "argocd_application" "microgateway" {
  metadata {
    name      = "${local.name_prefix}-microgateway"
    namespace = local.argocd_namespace
    labels = {
      region = var.region
      env    = var.project_environment
      loc    = var.project_region
      owner  = var.service_owner
      layer  = "service-module"
    }
  }
  wait = true

  spec {
    project = local.argocd_project
    source {
      repo_url        = local.helm_chart_url
      path            = "microgateway/${local.project_environment}/${local.project_region}"
      target_revision = local.helm_chart_revision
      helm {
        value_files = ["values.yaml"]
      }
    }

    destination {
      server    = local.kubernetes_server_url
      namespace = local.service_namespace
    }
    sync_policy {
      automated = {
        prune       = true
        self_heal   = true
        allow_empty = false
      }
      retry {
        backoff = {
          duration     = ""
          max_duration = ""
        }
        limit = "0"
      }
    }
  }
}