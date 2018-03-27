#!/bin/bash
clear

# AWS_CONFIG
export aws_default_region=us-east-1

echo "==>  Install versions === "
echo "==> JAVA "
java -version
echo "==> MAVEN "
mvn -version
echo "==> AWS-CLI "
aws --version
echo "==> DOCKER "
docker --version
echo "==> ECS-CLI COMPOSE "
ecs-cli --version

echo "==> aws ecr get-login $aws_default_region"
$(aws ecr get-login --no-include-email --region $aws_default_region)

echo "==> Install common jar and dependencies"
cd ../../fairanb-v2-common
mvn install

echo Build common completed on `date`
 