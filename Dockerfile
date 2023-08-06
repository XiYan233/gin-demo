# 使用 golang 作为基础镜像
FROM golang:1.19.10-alpine AS builder

# 设置工作目录
WORKDIR /app

# 复制项目源代码到容器中
COPY . /app

# 下载和安装依赖包 构建项目
RUN go mod download && go build -o gin-demo ./main.go

FROM alpine:latest as final

# 从builder中复制编译好的可执行文件
COPY --from=builder /app/gin-demo /app/

WORKDIR /app

# 暴露端口
EXPOSE 8080

# 启动项目
CMD ["./gin-demo"]
