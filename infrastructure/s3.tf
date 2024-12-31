resource "aws_s3_bucket" "terraform_state" {
  bucket = "code-runner-terraform-state"
  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_acl" "terraform_state_acl" {
  bucket = aws_s3_bucket.terraform_state.bucket
  acl = "private"
}
