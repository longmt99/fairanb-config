#!/bin/bash
clear
echo "#### Deploy all from empty docker-compose include images and docker container"

if [[ ("$#" -ne 1)  || ("$1" != dev && "$1" != qa && "$1" != stg && "$1" != prod)]]
  then echo "Invalid arguments supplied, input env_name project_name: dev customer | qa customer" 
     exit 1
fi
docker rm -f $(docker ps -a -q)
docker rmi -f $(docker images -f dangling=true)

./build-common.sh
export env_name=$1
echo "==> Build all images"
./build-image.sh $env_name discovery
./build-image.sh $env_name config
./build-image.sh $env_name gateway
./build-image.sh $env_name customer
./build-image.sh $env_name merchant
./build-image.sh $env_name inventory
./build-image.sh $env_name notification
./build-image.sh $env_name admin

docker rm -f $(docker ps -a -q)
docker rmi -f $(docker images -f dangling=true)

echo Deploy all images completed on `date`


 