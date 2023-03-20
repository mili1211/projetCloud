
terraform {
  backend "s3" {
    bucket = "mili-s3-project-c"
    key    = "terraform-projectC-mili.tfstate"
    region = "eu-west-1"
  }
}
