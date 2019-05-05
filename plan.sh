#!/bin/bash
env=$1

terraform plan -var-file="./$env/$env.tfvars" -state="./$env/$env.tfstate" -out="./$env/$env.tfplan"
