#!/bin/env bash

folder_path=$1
folder_path=$(cd $(dirname ${folder_path}) && pwd )
folder_name=$(basename ${folder_path})

base_dir=$(cd $(dirname $0) && pwd)
# dos2unix ${base_dir}/dev_shell.sh 
source ${base_dir}/dev_shell.sh



cat <<EOF>"${folder_path}/backend.tf"
data "terraform_remote_state" "${folder_name}" {
  backend="s3" 
  config = {
    bucket = "testdev1"
    key = "backend/folder1/${environment}/${folder_name}.tfsate"
    region = "${aws_region}"
    
  }
} 
EOF


cat <<EOF>"${folder_path}/variables.tf"
variable "environment" {
    default="${environment}"
}
variable "aws_region" {
    default="${aws_region}" 
}
variable "access_key" {
    default="${access_key}"
}
variable "secret_key" {
    default="${secret_key}"
} 
EOF



cat <<EOF>"${folder_path}/provider.tf"
provider "aws" {
  region  = var.aws_region

  access_key = var.access_key
  secret_key = var.secret_key
}
 
EOF
