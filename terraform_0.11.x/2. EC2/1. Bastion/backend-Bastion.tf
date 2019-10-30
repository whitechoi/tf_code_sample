# Backend - Terraform State 파일을 S3에 저장
terraform {
  backend "s3" {
    bucket     = "mzc-terraform-state-files" # 버켓은 사전생성
    key        = "TEST/terraform_bastion.tfstate" # state file의 저장위치
    region     = "ap-northeast-2"
  }
}