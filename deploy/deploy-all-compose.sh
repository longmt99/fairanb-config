#!/bin/bash
clear
echo "#### Deploy all from empty docker-compose include images and docker container"

if [[ ("$#" -ne 1)  || ("$1" != dev && "$1" != qa && "$1" != stg && "$1" != local)]]
  then echo "Invalid arguments supplied, input env_name project_name: dev customer | qa customer" 
     exit 1
fi

export env_name=$1
echo "==> Build all images"
./build-all-images.sh $env_name

echo "==> Build ECS .. "
./deploy-compose.sh $env_name

echo Deploy all compose completed on `date`
 