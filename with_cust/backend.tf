data "terraform_remote_state" "with_cust" {
  backend="s3" 
  config = {
    bucket = "testdev1"
    key = "backend/folder1/dev/with_cust.tfsate"
    region = "us-east-1"
    
  }
} 
