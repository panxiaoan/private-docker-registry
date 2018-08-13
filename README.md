# 搭建 私有 Docker 仓库

## 介绍
- Docker Registry：是 Docker 官方提供的镜像仓库服务，开源免费，用于搭建私有仓库服务，在内部分发镜像
- Docker Registry Web：能够通过浏览器可视化的查看镜像仓库中的：镜像、TAG、事件、删除镜像等

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

**注意事项**

- 当远程访问时，这个例子没有配置反向代理，所以需要修改客户端的 Docker 配置

``` shell
vim /usr/lib/systemd/system/docker.service

# 加入这一段：--insecure-registry 192.168.246.146:5000
ExecStart=/usr/bin/dockerd --insecure-registry 192.168.246.146:5000

# 生效和重启 Docker
systemctl daemon-reload
systemctl restart docker
```

- 另外在两个 config.yml 文件中的 URL 地址请写宿主机 IP 或者域名


