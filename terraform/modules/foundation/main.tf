variable "providers" { type = list(string) }
variable "fabric_id" { type = string }
resource "null_resource" "foundation_models" {
  count = length(var.providers)
  triggers = {
    provider = var.providers[count.index]
    fabric_id = var.fabric_id
    connected_via = "Equinix Fabric® Private - SP06"
    failover = "Fabric One - Automatico"
  }
}
