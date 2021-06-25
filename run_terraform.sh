#!/bin/sh
# Script to target terraform for multiple enviroments in automation during CICD
#Copyright 2021 Mukesh Sharma

#Licensed under the "THE BEER-WARE LICENSE" (Revision 42):
#Mukesh Sharma  wrote this file. As long as you retain this notice you
#can do whatever you want with this stuff. If we meet some day, and you think
#this stuff is worth it, you can buy me a beer or coffee in return


#set -xe

export TF_IN_AUTOMATION=true
#export TF_PLUGIN_CACHE_DIR="${HOME}/.terraform.d/plugin-cache"

ENV_PATH=env/$1/terraform.tfvars
BACKEND_PATH=env/$1/backend.conf
DEPLOY=$2
echo $TF_IN_AUTOMATION

rm -rf .terraform
terraform fmt -check
terraform init -backend-config=$BACKEND_PATH -input=false
terraform plan -var-file=$ENV_PATH -compact-warnings   -lock=true  -parallelism=100 -input=false

# Kill the job if the TF PLAN fails.
if [ $? -ne 0 ]
then
    exit 1;
fi

if [ "$DEPLOY" = "deploy" ]
then
    echo "Running Terraform Apply..."
    terraform apply  -var-file=$ENV_PATH  -auto-approve -compact-warnings
fi
