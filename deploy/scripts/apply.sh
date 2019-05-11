#!/bin/bash
env=$1
 
terragrunt apply --terragrunt-working-dir "./deploy/environments/$env/" "$PWD/deplo/environments/$env/terraform.tfplan"
