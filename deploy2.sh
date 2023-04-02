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

# 启动容器
docker run -d --name $service_name -p $port:$port --net mysqlnet $imageName:$tag
echo "容器启动成功"