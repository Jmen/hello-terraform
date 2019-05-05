#!/bin/bash
env=$1

terraform apply -state-out="./$env/$env.tfstate" "./$env/$env.tfplan"
