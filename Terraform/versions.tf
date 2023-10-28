terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.43.0"
    }
  }
}

provider "google" {
  credentials = var.google_key
  project     = "leejunseok-01-400304"
  region      = "asia-northeast3"
  zone        = "asia-northeast3-a"
}

# Terraform Cloud에서 Sensitive 변수(gcp_creds)를 추가해주었음
variable "google_key" {
  default = ""
}
