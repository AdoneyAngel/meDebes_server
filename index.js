require("dotenv").config()

const mysql = require("mysql")
const express = require("express")
const cors = require("cors")
const bcrypt = require("bcrypt")

const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
}, (err) => {
    if (err) {
        console.log(err)

    } else {
        console.log("Database conected")
    }
})

const app = express()
app.use(cors())
app.use(express.json())

app.listen(3001, (err, res) => {
    console.log("Running in: " + 3001)
})

//METHODS

app.get("/getUsers", (req, res) => {
    db.query("CALL sp_medebes_users_select()", (err, queryRes) => {
        if (err) {
            console.log(err)
            res.send(false)

        } else {
           res.send(queryRes) 
        }  
    })
})

app.post("/getUserByName", (req, res) => {
    const name = req.body.name

    if (name) {
        db.query("CALL sp_medebes_users_select_name(?)", [name], (err, queryRes) => {
            if (err) {
                console.log(err)
                res.send(false)

            } else {
                res.send(queryRes)
            }
        })
    }
})

app.post("/getUserByMail", (req, res) => {
    const mail = req.body.mail

    if (mail) {
    db.query("CALL sp_medebes_users_select_mail(?)", [mail], (err, queryRes) => {
        if (err) {
            console.log(err)
            res.send(false)

        } else {
            res.send(queryRes)
        }
      })  
    }
    
})

app.post("/createUser", async (req, res) => {
    const name = req.body.name
    const mail = req.body.mail
    const password = req.body.password

    if (name && mail && password) {
        const passwordEncrypted = await genEncrypt(password)

        db.query("CALL sp_medebes_users_insert(?,?,?)", [name, mail, passwordEncrypted], (err, queryRes) => {
            if (err) {
                console.log(err)
                res.send(false)

            } else {
                res.send(true)
            }
        })

    } else {
        res.send(false)
    }
})

app.post("/login", async (req, res) => {
    const mail = req.body.mail
    const password = req.body.password

    if (mail, password) {
        db.query("CALL sp_medebes_users_select_mail(?)", [mail], async (err, queryRes) => {
            if (err) {
                console.log(err)
                res.send(false)

            } else if (queryRes) {
                if (queryRes[0].length > 0) {
                    const match = await compareEncrypt(queryRes[0][0].password, password)

                    if (match) {
                        res.send(true)

                    } else {
                        res.send(false)
                    }     

                } else {
                    res.send(false)
                }

            } else {
                res.send(false)
            }
        })

    } else {
        console.log("without mail & password")
        res.send(false)
    }
})

app.post("/getUserProfileByMail", async (req, res) => {
    const mail = req.body.mail

    if (mail) {
        db.query("CALL sp_medebes_users_select_mail(?)", [mail], async (err, queryRes) => {
            if (err) {
                console.log(err)
                res.send(false)

            } else if (queryRes) {
                if (queryRes) {
                    const profile = {
                        name: queryRes[0][0].name,
                        mail: queryRes[0][0].mail
                    }

                    res.send(profile)
                }
            } else {
                res.send(false)
            }
        })
    }
})

app.post("/getUserProfile", async (req, res) => {
    const id = req.body.id

    if (id) {
        db.query("CALL sp_medebes_users_select_id(?)", [id], async (err, queryRes) => {
            if (err) {
                console.log(err)
                res.send(false)

            } else if (queryRes) {
                if (queryRes) {
                    const profile = {
                        name: queryRes[0][0].name,
                        mail: queryRes[0][0].mail
                    }

                    res.send(profile)
                }
            } else {
                res.send(false)
            }
        })
    }
})

app.post("/getContactProfile", async (req, res) => {
    const id_user_from = req.body.user_from
    const id_user_to = req.body.user_to
    
    if (id_user_from && id_user_to) {
        db.query("CALL sp_medebes_contacts_select_user_to_profile(?, ?)", [id_user_from, id_user_to], async (err, queryRes) => {
            if (err) {
                console.log(err)
                res.send(false)

            } else if (queryRes) {
                if (queryRes) {
                    const profile = {
                        id: queryRes[0][0].id,
                        name: queryRes[0][0].name,
                        mail: queryRes[0][0].mail,
                        nickname: queryRes[0][0].nickname
                    }

                    res.send(profile)
                }
            } else {
                res.send(false)
            }
        })

    } else {
        console.log("Without data")
        res.send(false)
    }
})

app.post("/getContactsById", (req, res) => {
    const id = req.body.id

    if (id) {
        db.query("CALL sp_medebes_contacts_select_user_from(?)", [id], (err, queryRes) => {
            if (err) {
                console.log(err)
                res.send(false)

            } else {
                res.send(queryRes)
            }
        })   
             
    } else {
        res.send(false)
    }

})

app.post("/getContactsProfileById", (req, res) => {
    const id = req.body.id

    if (id) {
        db.query("CALL sp_medebes_contacts_select_user_from_profiles(?)", [id], (err, queryRes) => {
            if (err) {
                console.log(err)
                res.send(false)

            } else {
                res.send(queryRes)
            }
        })   
             
    } else {
        res.send(false)
    }

})

app.post("/getUserByInfo", (req, res) => {
    const info = req.body.info

    if (info) {
        db.query("CALL sp_medebes_users_select_mail_or_name(?)", [info], (err, queryRes) => {
            if (err) {
                console.log(err)
                res.send(false)

            } else {
                res.send(queryRes)

            }
        })

    } else {
        res.send(false)
    }
})

app.post("/addContact", (req, res) => {
    const id_from = req.body.id_from
    const id_to = req.body.id_to
    const nickname = req.body.nickname

    if (id_from && id_to && nickname) {
        db.query("CALL sp_medebes_contacts_insert(?,?,?)", [id_from, id_to, nickname], (err, queryRes) => {
            if (err) {
                res.send(false)

            } else {
                res.send(true)
            }
        })

    } else {
        res.send(false)
    }
})

app.post("/deleteContact", (req, res) => {
    const user_from = req.body.id_from
    const user_to = req.body.id_to

    if (user_from && user_to) {
        db.query("CALL sp_medebes_contacts_delete(?,?)", [user_from, user_to], (err, queryRes) => {
            if (err) {
                console.log(err)
                res.send(false)

            } else {
                res.send(true)
            }
        })
    }
})

app.post("/renameContact", (req, res) => {
    const user_from = req.body.id_from
    const user_to = req.body.id_to
    const nickname = req.body.nickname

    if (user_from && user_to && nickname) {
        db.query("CALL sp_medebes_contacts_rename(?,?,?)", [user_from, user_to, nickname], (err, queryRes) => {
            if (err) {
                console.log(res)
                res.send(false)

            } else {
                res.send(true)
            }
        })

    } else {
        console.log("Without data")
        res.send(false)
    }
})

const genEncrypt = async (txt) => {
    let encrypted = null

    await bcrypt.genSalt(10).then(async (salt, err) => {
        if (err) {
            console.log(err)

        } else {

            //Se genera el hash

            await bcrypt.hash(txt, salt, null).then((hash, err) => {

                if (err) {
                    console.log(err)

                } else {
                    encrypted = hash
                }

            })

        }
    })

    return encrypted
}

const compareEncrypt = async (hash, text) => {
    const match = await bcrypt.compare(text, hash)

    return match
} 