provider "aws" {
    region              = var.region
    allowed_account_ids = [var.aws_allow_account_id]
}