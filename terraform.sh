#!/usr/bin/env bash
set -e

if [ "$#" -ne 2 ]
then
printf "Two parameters required. \n1. Terraform action (e.g. plan) \n2. Environment to run against (e.g. sandbox)"
exit 1
fi


TERRAFORM_ACTION=$1
ENVIRONMENT=$2
TERRAFORM_STATE_BUCKET=${ENVIRONMENT}-order-discovery-terraform-state
BACKEND_CONFIG="-backend-config=bucket=${TERRAFORM_STATE_BUCKET} -backend-config=region=us"

export GOOGLE_APPLICATION_CREDENTIALS=~/.google_cloud/account.json

echo "Using state bucket: ${TERRAFORM_STATE_BUCKET}"

cd environment-infrastructure
terraform init ${BACKEND_CONFIG}
terraform ${TERRAFORM_ACTION} -var-file=../variables/${ENVIRONMENT}/environment.tfvars
