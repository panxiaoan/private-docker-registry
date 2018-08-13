# 搭建 私有 Docker 仓库

## 参考
- https://docs.docker.com/registry/deploying/#run-the-registry-as-a-service
- https://github.com/mkuchin/docker-registry-web

## 使用方法

### Step.1 下载镜像

```shell
docker pull registry:2.6.2
docker pull hyper/docker-registry-web
```

### Step.2 创建验证文件

```
cd ../private-docker-registry
./generate-keys.sh
```

### Step.3 创建、下载、运行容器

```
cd ../private-docker-registry
docker-compose up -d
```
