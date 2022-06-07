terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  email = "ferrinho@gmail.com"
  api_token = "y1_0u6UWlvwJkVEm7MM9K3V7ocfhsdLtZ5NQkT1b"
}
