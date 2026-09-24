variable "neoclouds" { type = list(string) }
variable "csps" { type = list(string) }
resource "null_resource" "fabric_one" {
  triggers = {
    service = "Equinix Fabric One - Managed Service"
    routing = "Automatico"
    encryption = "Gerenciada"
    redundancy = "Dual - Edge Metro A/B"
    note = "Voce informa o que conectar, ele gerencia o resto"
  }
}
