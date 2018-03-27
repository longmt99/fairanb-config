# fairanb-v2-config


# Step deploy docker and docker-compose AWS ECS
## Requirements
	1.  java 1.8+
	2.  Apache Maven 3.3.9 +
	3.  aws-cli 1.11+
	4.  Docker version 1.13.1 +
	5.  ecs-cli version 1.3.0 +
	6.  AWS Access ID and Access Key 
## How Deploy ECS
	1.  At local we install ecs-cli, docker compose 
	2.  Build all image at local, 
	3.  At AWS create repository to store images 
	4.  Push all images from local to AWS repository 
	5. prepare docker-compose.yml 
	6. Using AWS Access ID and Access Key to configure AWS 
	7. Using ecs-cli deploy ecs cluster
## Details run command all application
$ aws configure
$ cd /git/fairanb-v2-config/deploy
$ ./build-common.sh
$ ./build-all-images.sh dev

## Run Command each microservice
If only deploy one microservice for debugging
$ ./build-image.sh dev customer
$ ./deploy-compose.sh dev

## Plus commands check docker and compose and debug logging 
$ docker images
$ docker rmi -f $(docker images -f dangling=true)
$ docker ps -a
$ docker rm $(docker ps -a -f status=exited -q)
$ docker stats --


### Document install at AWS
	-  https://dzone.com/articles/8-simple-steps-to-install-mongodb-with-authenticat-1
	-  https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04
	 1  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
    2  echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
    3  sudo apt-get update
    4  sudo apt-get install -y mongodb-org
    5  sudo systemctl start mongod
    6  sudo systemctl status mongod
    7  sudo systemctl enable mongod
    8  sudo ufw allow 27017
	
