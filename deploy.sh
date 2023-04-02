#! /bin/sh
#接收外部参数
nexus_url=$1
nexus_project=$2
service_name=$3
tag=$4
port=$5
imageName=$nexus_url/$nexus_project/$tag/$service_name

echo "$imageName:$tag"

#查询容器是否存在，存在则删除
containerId=`docker ps -a | grep -w $service_name | awk '{print $1}'`
if [ "$containerId" != "" ] ; then
  #停掉容器
  docker stop $containerId
  #删除容器
  docker rm $containerId
  echo "成功删除容器"
fi

#查询镜像是否存在，存在则删除
imageId=`docker images | grep -w $imageName | awk '{print $3}'`
if [ "$imageId" != "" ] ; then
  #删除镜像
  docker rmi -f $imageId
  echo "成功删除镜像"
fi

# 登录nexus私服
docker login -u docker01 -p 123456 $nexus_url

# 下载镜像
docker pull $imageName:$tag

# 启动容器
docker run -d --name $service_name -p $port:$port --net mysqlnet $imageName:$tag
echo "容器启动成功"