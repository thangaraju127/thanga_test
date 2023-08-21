env=$1
aws_region=$2
folder_path=$3
folder_path=$(cd $(dirname ${folder_path}) && pwd )
folder_name=$(basename ${folder_path})


cat <<EOF>"${folder_path}/backend.tf"
data "terraform_remote_state" "pipeline1" {
  backend="s3" 
  config = {
    bucket = "testdev1"
    key = "backend/folder1/${env}/${folder_name}.tfsate"
    region = "${aws_region}"
    
  }
} 
EOF
