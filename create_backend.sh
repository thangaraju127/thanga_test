env=$1
aws_region=$2
filename=$3

cat <<EOF>"${i}/test.tf"
data "terraform_remote_state" "pipeline1" {
  backend="s3" 
  config = {
    bucket = "testdev1"
    key = "backend/folder1/${env}/${filename}.tfsate"
    region = "${aws_region}"
    
  }
} 
EOF