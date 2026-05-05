resource "aws_s3_bucket" "bucket" {
  bucket = "jhonnyulisilva-local-state"
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}