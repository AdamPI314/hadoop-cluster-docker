# hadoop-cluster-docker
Modified from [joway/hadoop-cluster-docker.](https://github.com/joway/hadoop-cluster-docker)

### Nodes Hadoop Cluster

#### 1. pull docker image

```
sudo docker pull drdotevil/scratch:hadoop-cluster-1.0.0
```

#### 2. clone github repository

```
git clone https://github.com/AdamPI314/hadoop-cluster-docker.git
```

#### 3. create hadoop network

```
sudo docker network create --driver=bridge hadoop
```

#### 4. start container

```
cd hadoop-cluster-docker
sudo ./start-container.sh
```

**output:**

```
start hadoop-master container...
start hadoop-slave1 container...
start hadoop-slave2 container...
root@hadoop-master:~# 
```
- start 2 containers with 1 master and 1 slaves
- you will get into the /root directory of hadoop-master container

#### 5. start hadoop

```
./start-hadoop.sh
```

#### 6. run wordcount

```
./run-wordcount.sh
```

**output**

```
input file1.txt:
Hello Hadoop

input file2.txt:
Hello Docker

wordcount output:
Docker    1
Hadoop    1
Hello    2
```

#### 7. sync src

local directory:  
* \~/src/

hadoop master directory:  
* /root/src/

copy source codes into local directory (\~/src/), any changes made locally (\~/src/) will be pushed to hadoop master director(/root/src/). In other owrds, Docker will do an in-place update.

#### 8. misc:
1. build docker image  
* `./build_image.sh`
2. ssh into hadoop_master   
* `./enter_master_bash.sh`
3. clear docker container  
* `./delete_all_container.sh`
