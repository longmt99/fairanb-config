#!/bin/bash
clear

echo "#### Build docker containers"

if [[ ("$#" -ne 1)  || ("$1" != dev && "$1" != qa && "$1" != stg &&  "$1" != local)]]
  then
    echo "Invalid arguments supplied, input env_name project_name: dev  | sandbox " 
    exit 1
fi

echo "==> Build ECS .. "
echo Create COMPOSE on started on `date`
ecs-cli compose up
echo Deploy compose completed on `date`
 