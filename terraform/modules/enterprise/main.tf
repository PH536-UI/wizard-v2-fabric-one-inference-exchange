variable "project_name" { type = string }
resource "null_resource" "enterprise_customer" {
  triggers = {
    ai_infra = "AI Infrastructure - On-Prem"
    storage  = "High-Performance Storage"
    compute  = "GPU Cluster - Validado SP06"
  }
}
