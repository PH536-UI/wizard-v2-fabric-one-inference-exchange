variable "locations" { type = list(string) }
variable "services" { type = list(string) }
resource "null_resource" "edge_metro" {
  count = length(var.locations)
  triggers = {
    location = var.locations[count.index]
    service = join(", ", var.services)
    arch = "NVIDIA Enterprise Reference Architecture"
  }
}
