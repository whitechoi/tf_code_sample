# provider 
provider "aws" {
  #version = "~> 1.41.0" #AWS Provider 버전 설정, 미지정시 최신버전
  region     = "${var.region}"
}
