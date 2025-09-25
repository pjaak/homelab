terraform {
  required_version = "~> 1.7"
  backend "s3" {
    bucket         = "your-terraform-state-bucket-name" # Replace with your S3 bucket name
    key            = "path/to/your/terraform.tfstate"   # Replace with your desired key/path
    region         = "us-east-1"                       # Replace with your AWS region
    dynamodb_table = "your-terraform-state-lock-table" # Replace with your DynamoDB table name
    encrypt        = true                              # Optional: Enable server-side encryption
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.30.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.26.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "~> 3.4.0"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

provider "kubernetes" {
  # Use KUBE_CONFIG_PATH environment variables
  # Or in cluster service account
}
