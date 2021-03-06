# hadoop-cluster-docker
Modified from [joway/hadoop-cluster-docker.](https://github.com/joway/hadoop-cluster-docker)

### Nodes Hadoop Cluster

#### 1. pull docker image

```
docker pull drdotevil18/scratch:hadoop-cluster-1.0.0
```

#### 2. clone github repository

```
git clone https://github.com/AdamPI314/hadoop-cluster-docker.git
```

#### 3. start container

```
cd hadoop-cluster-docker
/bin/sh start_container.sh
```

**output:**

```
start hadoop-master container...
start hadoop-slave1 container...
start hadoop-slave2 container...
```
- start 2 containers with 1 master and 1 slaves
- you will get into the /root directory of hadoop-master container

#### 4. enter master node

```
/bin/sh enter_master.sh
```

#### 5. start hadoop

```
/bin/sh start_hadoop.sh
```

#### 6. run wordcount

```
/bin/sh run_wordcount.sh
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
* `/bin/sh build_image.sh`
2. ssh into hadoop_master   
* `/bin/sh enter_master.sh`
3. clear docker container  
* `/bin/sh delete_all_container.sh`
