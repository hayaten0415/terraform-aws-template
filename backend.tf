terraform {
    backend "s3" {
        bucket = "" #edit here
        key    = "tfstate/terraform.tfstate"
        region = "" #edit here
    }
}