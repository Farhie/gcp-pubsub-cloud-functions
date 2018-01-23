terraform {
  required_version = "0.11.2"

  backend "gcs" {}

}

provider "google" {
  project     = "sandbox"
  region      = "us-central1"
}
