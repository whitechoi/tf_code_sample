#Bastion Data
data "terraform_remote_state" "bastion_data" {
  backend = "s3"
  config = {
    bucket = "mzc-terraform-state-files"      # 버켓은 사전생성
    key    = "TEST/terraform_bastion.tfstate" # state file의 저장위치
    region = "ap-northeast-2"
  }
}

