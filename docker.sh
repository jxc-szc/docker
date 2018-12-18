#!/bin/sh
stopDocker()
{
    pid=`ps -ef|grep docker|grep java|awk '{print $2}'`
    echo "docker Id list :$pid"
    if [ "$pid" = "" ]
    then
      echo "no docker pid alive"
    else
      kill -9 $pid
    fi
}

startDocker()
{
    java -jar docker.jar >/dev/null 2>&1 &
}

#到当前工作目录下
cd $PROJ_PATH/order
mvn clean install

#停止
stopDocker

# 备份
data=$(date "+%Y%m%d%H%M%S")
mkdir -p $DOCKER_PATH/bak/${data}
mv $DOCKER_PATH/docker.jar ../$DOCKER_PATH/bak/${data}
rm -f $DOCKER_PATH/docker.jar

# 复制新的工程
cp $PROJ_PATH/order/target/docker-demo-0.0.1-SNAPSHOT.jar $DOCKER_PATH

cd $DOCKER_PATH
mv docker-demo-0.0.1-SNAPSHOT.jar docker.jar

# 启动
stopDocker