#!/bin/bash
env=$1
 
terragrunt apply --terragrunt-working-dir "./$env/" "$PWD/$env/terraform.tfplan"
