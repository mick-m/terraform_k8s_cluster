# Terraform K8S cluster

Prerequisites
-------------

Terraform should installed locally - e.g.
```
$ brew install terraform
```

Expects a file such as `credentials.auto.tfvars` - sample contents:
```
proxmox_api_url = "https://0.0.0.0:8006/api2/json"  # Your Proxmox IP Address
proxmox_api_token_id = "terraform@pam!terraform"  # API Token ID
proxmox_api_token_secret = "your-api-token-secret"
```

NB: Above file contains sensitive data and should be added to .gitignore

To initialize terraform, run  the following:
```
$ terraform init
```

To test the plan:
```
terraform plan
```

When happy to proceed, run:
```
$ terraform apply -auto-approve
```

Inspired by: https://youtu.be/dvyeoDBUtsU
