# 搭建 私有 Docker 仓库

## 参考
- https://docs.docker.com/registry/deploying/#run-the-registry-as-a-service
- https://github.com/mkuchin/docker-registry-web

## 使用方法

**准备**

``` shell

# 下载镜像
docker pull registry:2.6.2
docker pull hyper/docker-registry-web

# 创建一些目录
mkdir -p /usr/local/docker/registry
mkdir -p /usr/local/docker/registry-auth
mkdir -p /usr/local/docker/registry-data

# 克隆 private-docker-registry 项目
cd /usr/local/docker
git clone https://github.com/panxiaoan/private-docker-registry.git

```

**创建验证文件**

``` shell
cd ../private-docker-registry
./generate-keys.sh
```

**创建、下载、运行容器**

``` shell
cd ../private-docker-registry
docker-compose up -d
```

**使用**
- Docker Registry: localhost:5000
- Docker Registry Web UI: http://localhost:5001
- 默认账号密码：admin / admin
- 登录后，请给 admin 添加 **write-all**

**测试**

``` shell
# 此处登录的是 Registry
docker login localhost:5000
docker pull hello-world
docker tag hello-world localhost:5001/hello-world:v1.0.0
docker push localhost:5001/hello-world:v1.0.0

docker rmi localhost:5000/hello-world:v1.0.0
docker run localhost:5000/hello-world:v1.0.0 
```


