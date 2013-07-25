package main

import (
	"github.com/astaxie/beego"
	"github.com/spartacusX/starthere/controllers"
)

func main() {
	beego.RegisterController("/", &controllers.MainController{})

	beego.Run()
}
