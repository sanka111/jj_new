resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
}


#resource "aws_s3_bucket_ownership_controls" "aws_s3_bucket_ownership" {
#  bucket = aws_s3_bucket.website_bucket.id
#  rule {
#    object_ownership = "BucketOwnerPreferred"
#  }
#}

#resource "aws_s3_bucket_acl" "website_bucket_acl" {
##  depends_on = [aws_s3_bucket_ownership_controls.aws_s3_bucket_ownership]
#
#  bucket = aws_s3_bucket.website_bucket.id
#  acl    = "private"
#}

##resource "aws_s3_object" "index" {
##  bucket = aws_s3_bucket.website_bucket.bucket
##  key    = "index.html"
##  source = "/index.html"  # Path to your local index.html file
##  acl    = "public-read"
##}
##
##resource "aws_s3_object" "error" {
##  bucket = aws_s3_bucket.website_bucket.bucket
##  key    = "error.html"
##  source = "/index.html"  # Path to your local error.html file
##  acl    = "public-read"
##}