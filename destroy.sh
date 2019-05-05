#!/bin/bash
env=$1

terraform destroy -var-file="./$env/$env.tfvars" -state="./$env/$env.tfstate"
