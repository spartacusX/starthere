package models

import (
	_ "code.google.com/p/odbc"
	"database/sql"
	"fmt"
)

type SHSite struct {
	LSiteId      int
	Name         string
	Type         string
	Address      string
	BSystem      int
	Language     string
	Organization string
	Icon         []byte
}

var DRIVER = "odbc"
var TABLE = "starthere.dbo.shsites"
var CNXSTRING = "dsn=starthere;uid=sa;pwd=sasa"

/**************************************************************
/ Open database, not really connect, just regist driver and dsn
/**************************************************************/
func sqlConnect() (db *sql.DB, err error) {
	db, err = sql.Open(DRIVER, CNXSTRING)
	if err != nil {
		fmt.Println("sql.Open failed: ", err)
		return nil, err
	}
	return db, nil
}

func SiteList() (siteList []SHSite, err error) {
	sites := []SHSite{}
	db, err := sqlConnect()
	if err != nil {
		return sites, err
	}

	defer db.Close()

	rows, err := db.Query("select * from " + TABLE)
	if err != nil {
		fmt.Println("db.Query failed: ", err)
		return sites, err
	}

	for rows.Next() {
		var r SHSite
		err := rows.Scan(&r.LSiteId,
			&r.Name,
			&r.Type,
			&r.Address,
			&r.BSystem,
			&r.Language,
			&r.Organization,
			&r.Icon)

		if err != nil {
			fmt.Println("rows.Scan failed: ", err)
			return sites, err
		} else {
			sites = append(sites, r)
		}
	}
	fmt.Println(sites)
	return sites, nil
}

func AddSite(site SHSite) (err error) {
	db, err := sqlConnect()
	if err != nil {
		return err
	}

	defer db.Close()

	res, err := db.Exec("insert into "+TABLE+" (Name, Type, Address, bSystem, Language, Organization) values ( ?, ?, ?, ?, ?, ?)",
		site.Name,
		site.Type,
		site.Address,
		site.BSystem,
		site.Language,
		site.Organization)
	if err != nil {
		fmt.Println("db.Exec failed: ", err)
		return err
	}

	rowAffected, _ := res.RowsAffected()
	fmt.Println("Affected rows: ", rowAffected)

	return nil
}
