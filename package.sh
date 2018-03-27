#!/bin/bash
# Description: Deploy Rest API to AWS EC2

#if [[ ("$#" -ne 1) || ("$1" != tenants && "$1" != users && "$1" != merchants && "$1" != customers)]]
  # then echo "Invalid arguments supplied, input env_name: tenants | users | merchants | customers"
    # exit 1
#fi


cd /home/longmt/git

mvn clean install -f fairanb-v2-common/pom.xml

mvn clean package docker:build -f fairanb-v2-auth/pom.xml
mvn clean package docker:build -f fairanb-v2-inventory/pom.xml
mvn clean package docker:build -f fairanb-v2-merchant/pom.xml
mvn clean package docker:build -f fairanb-v2-customer/pom.xml

mvn clean package docker:build -f fairanb-v2-discovery/pom.xml
mvn clean package docker:build -f fairanb-v2-gateway/pom.xml
mvn clean package docker:build -f fairanb-v2-config/pom.xml

#docker-compose -f fairanb-v2-config/docker-compose.yml up 

echo "######### DONE PACKAGE #######"	


