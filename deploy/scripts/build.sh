#!/usr/bin/env bash

dotnet build ./src/HelloTerraformDotNetCore/HelloTerraformDotNetCore.csproj
dotnet lambda package -pl ./src/HelloTerraformDotNetCore ./output/lambda.zip