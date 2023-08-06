package main

import (
	"github.com/gin-gonic/gin"
)

func main() {
	// 创建一个默认的 Gin 引擎
	router := gin.Default()

	// 定义一个通用的路由，处理所有路径
	router.NoRoute(func(c *gin.Context) {
		c.String(200, "Hello, Gin!")
	})

	// 启动服务器并监听端口
	router.Run(":8080")
}
