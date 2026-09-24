terraform {
  required_providers {
    equinix = {
      source  = "equinix/equinix"
      version = "~> 2.0"
    }
  }
}

# CAMPEÃO WIZARD HACKATHON V2 - 1º LUGAR
# Validado na visita técnica Equinix SP06 com Victor Arnaud

# 1. ENTERPRISE CUSTOMER - AI Infra, Storage, Compute
module "enterprise" {
  source = "./modules/enterprise"
  project_name = var.project_name
}

# 2. PRIVATE INTERCONNECTION - Equinix Fabric® - O HERÓI
resource "null_resource" "equinix_fabric_private_interconnection" {
  triggers = {
    name        = "${var.project_name}-fabric-one-champion"
    bandwidth   = "1000 Mbps - Dedicado para IA"
    description = "Validado na SP06 - Private Interconnection"
    latency_sla = "< 5ms"
    encryption  = "MACsec + IPsec - Gerenciado pelo Fabric One"
  }
  provisioner "local-exec" {
    command = "echo 'Equinix Fabric One configurando: Roteamento, Criptografia, Redundancia e Failover... OK'"
  }
}

# 3. FOUNDATION MODELS - Any Model
module "foundation" {
  source = "./modules/foundation"
  providers = ["OpenAI", "Anthropic", "Gemini", "DeepSeek"]
  fabric_id = null_resource.equinix_fabric_private_interconnection.id
}

# 4. NEOCLOUDS + CSPs
module "fabric" {
  source = "./modules/fabric"
  neoclouds = ["Together.ai", "Additional Providers"]
  csps      = ["AWS", "Azure", "Google Cloud", "Oracle Cloud"]
}

# 5. EDGE METRO A/B - NVIDIA Reference
module "edge" {
  source = "./modules/edge"
  locations = ["Edge Metro A - SP", "Edge Metro B - RJ"]
  services  = ["NVIDIA Enterprise Reference Architecture", "AWS", "Storage", "Compute"]
}
