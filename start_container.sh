#!/bin/bash

# the default node number is 3 
N=${1:-3}

# create network named hadoop
docker network rm $(docker network ls | grep "hadoop" | awk '/ / { print $1 }') &> /dev/null
docker network create --driver=bridge hadoop

# start hadoop master container
docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."

# volume dir
mkdir -p ~/src/ &> /dev/null
chmod -R 777 ~/src &> /dev/null
rm ~/src/{\?,\!}* -rf &> /dev/null

docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
				-v ~/src:/root/src \
                --name hadoop-master \
                --hostname hadoop-master \
                drdotevil18/scratch:hadoop-cluster-1.0.0 &> /dev/null


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	docker run -itd \
	                --net=hadoop \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                drdotevil18/scratch:hadoop-cluster-1.0.0 &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
# docker exec -it hadoop-master bash
