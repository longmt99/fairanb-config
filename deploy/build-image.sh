#!/bin/bash

echo "#### Build docker image"

if [[ ("$#" -ne 2)  || ("$1" != dev && "$1" != qa && "$1" != stg && "$1" != local)]]
  then  echo "Invalid arguments supplied, input env_name project_name: dev customer | qa inventory" 
    exit 1
fi

# AWS_CONFIG
export aws_account_id=73259782stst
export aws_default_region=us-east-1

export env_name=$1
export tag_version=$env_name.v2.0
export service_name=$2-service
export repository_name=fairanb-v2-$2

echo "==> Install application jar"  $service_name
cd ../../

docker rm -f $service_name

echo "==> Build docker image:  " $repository_name " from source " $repository_name
mvn clean package docker:build -f $repository_name/pom.xml


docker run --name $service_name -d -e spring.profiles.active=$env_name $repository_name:$tag_version
docker commit $service_name $aws_account_id.dkr.ecr.$aws_default_region.amazonaws.com/$repository_name:$tag_version
echo "==> push docker image:  " $repository_name:$tag_version
docker push $aws_account_id.dkr.ecr.$aws_default_region.amazonaws.com/$repository_name:$tag_version

echo Build image completed on `date`


###### docker run --name discovery-service -d -e spring.profiles.active=$env_name discovery-service
###### docker commit discovery-service 73259782stst.dkr.ecr.us-east-1.amazonaws.com/fairanb-v2-discovery:dev.v2.0