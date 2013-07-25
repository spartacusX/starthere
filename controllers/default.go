package controllers

import (
	"fmt"
	"github.com/astaxie/beego"
	m "github.com/spartacusX/starthere/models"
)

type MainController struct {
	beego.Controller
}

func (this *MainController) Get() {
	// crupkg := models.GetCruPkg(this.Ctx.Params[":pkg"])
	// this.Data["CruPkg"] = crupkg
	// pkglist := models.GetAllPkg()
	// pm := make([]map[string]interface{}, len(pkglist))
	// for _, pk := range pkglist {
	// 	m := make(map[string]interface{}, 2)
	// 	m["PKG"] = pk
	// 	if this.Ctx.Params[":pkg"] == pk.Pathname {
	// 		m["Cru"] = true
	// 	} else {
	// 		m["Cru"] = false
	// 	}
	// 	pm = append(pm, m)
	// }
	// this.Data["PkgList"] = pm
	// if crupkg.Id == 0 {
	// 	this.Data["Content"] = welcome //template.HTML(string(blackfriday.MarkdownCommon([]byte(welcome))))
	// } else {
	// 	at := models.GetArticle(crupkg.Id)
	// 	this.Data["Content"] = at.Content //template.HTML(string(blackfriday.MarkdownCommon([]byte(at.Content))))
	// }

	sites, _ := m.SiteList()
	this.Data["Sites"] = sites
	this.Layout = "home.html"
	this.TplNames = "site/site.tpl"
}

func (this *MainController) Post() {
	fmt.Println("Http method: Post")
	req := this.Ctx.Request
	req.ParseForm()

	var site m.SHSite
	site.BSystem = 1
	site.Language = "English"
	site.Name = req.Form.Get("SiteName")
	site.Type = req.Form.Get("SiteType")
	site.Address = req.Form.Get("SiteAddress")
	site.Organization = req.Form.Get("Organization")

	fmt.Println(site)

	m.AddSite(site)

	this.Ctx.Redirect(302, "/")
}
