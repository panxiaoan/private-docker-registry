# 搭建 私有 Docker 仓库

## 参考
- https://docs.docker.com/registry/deploying/#run-the-registry-as-a-service
- https://github.com/mkuchin/docker-registry-web

## 使用方法

### Step.1 准备

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

### Step.2 创建验证文件

``` shell
cd ../private-docker-registry
./generate-keys.sh
```

### Step.3 创建、下载、运行容器

``` shell
cd ../private-docker-registry
docker-compose up -d
```
