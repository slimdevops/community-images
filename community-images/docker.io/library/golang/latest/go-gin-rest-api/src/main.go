package main

import (
	"fmt"

	"github.com/gin-gonic/gin"
)

func main() {
	fmt.Println("go-gin-rest-api")
	r := gin.Default()
	r.GET("/", MainGet)
	r.Run()
}

func MainGet(c *gin.Context) {
	c.JSON(200, gin.H{
		"message": "success",
	})
}
