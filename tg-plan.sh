#!/bin/bash
env=$1

terragrunt plan -out="$PWD/$env/terraform.tfplan" --terragrunt-working-dir "./$env/"
