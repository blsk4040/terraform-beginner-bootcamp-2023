terraform {
 # cloud {
#   organization = "blsk4040"

 #   workspaces {
#      name = "terra-house-1"
#    }
#  }

  
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}




