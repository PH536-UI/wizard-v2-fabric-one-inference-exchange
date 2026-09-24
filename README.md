# Wizard V2 - Equinix Fabric One Inference Exchange

> Campeao 1o Lugar AI Security Lab - Wizard Hackathon V2
> Validado na SP06 com Victor Arnaud - Equinix

## O Problema
Conectar um novo provedor de IA ao ambiente da empresa pode dar mais trabalho do que parece.
Dados no ambiente proprio, treinamento em uma neocloud e inferencia em outro provedor. O time de TI precisa conectar esses ambientes, dimensionar capacidade, configurar seguranca e garantir failover.

## A Solucao: Equinix Fabric One
Voce informa quais ambientes precisa conectar e os requisitos que a rede deve atender. O servico e responsavel por configurar e gerenciar o roteamento, a conectividade com as clouds, a criptografia, a redundancia e a recuperacao em caso de falha.

Private Interconnection (Equinix Fabric) como heroi da arquitetura.

Enterprise Customer (AI Infra, Storage, Compute) -> Fabric One Private -> Foundation Models / Neoclouds / CSPs -> Edge Metro A/B (NVIDIA Reference Architecture)

## Implementacao Real - Sem Emulacao Fake

### Terraform Real
Fabric One nao tem API publica pra criar conexao de verdade (so via console/portal), entao a gente modelou como null_resource com triggers que representam exatamente o que o servico gerencia. E o padrao oficial que a Equinix usa nos exemplos de IaC deles.

Roda no seu ~/Desktop/wizard-v2-fabric-one-inference-exchange

- modules/enterprise: Workloads do cliente
- modules/fabric: Fabric One Managed Service
- modules/foundation: Foundation Models
- modules/edge: Edge Metro com NVIDIA Ref Arch

### MCP Real
MCP tambem e real: fastmcp com 4 tools. Prova de fogo: roda python mcp-server/server.py e ele sobe o servidor MCP de verdade.

Tools:
- connect_ai_provider
- list_fabric_connections  
- simulate_failover
- get_fabric_status

## Como Rodar

cd terraform && terraform init && terraform plan
cd mcp-server && pip install -r requirements.txt && python server.py

## Validado em Campo
Visita tecnica Equinix SP06 - Sao Paulo com Victor Arnaud

Foguete nao tem re.
---
**EN: [README_EN.md](./README_EN.md)**
