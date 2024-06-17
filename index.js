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
    db.connect()

    db.query("CALL sp_medebes_users_select()", (err, queryRes) => {
        if (err) {
            console.log(err)

        } else {
           res.send(queryRes) 
        }  

        db.end()
    })
})

app.post("/getUserByName", (req, res) => {
    const name = req.body.name

    if (name) {
        db.connect()
        
        db.query("CALL sp_medebes_users_select_name(?)", [name], (err, queryRes) => {
            if (err) {
                console.log(err)

            } else {
                res.send(queryRes)
            }

            db.end()
        })
    }
})

app.post("/getUserByMail", (req, res) => {
    db.connect()
    const mail = req.body.mail

    if (mail) {
    db.query("CALL sp_medebes_users_select_mail(?)", [mail], (err, queryRes) => {
        if (err) {
            console.log(err)

        } else {
            res.send(queryRes)
        }

        db.end()
      })  
    }
    
})

app.post("/createUser", async (req, res) => {
    db.connect()
    const name = req.body.name
    const mail = req.body.mail
    const password = req.body.password

    if (name && mail && password) {
        const passwordEncrypted = await genEncrypt(password)

        console.log("Hash generado: " + passwordEncrypted)

        db.query("CALL sp_medebes_users_insert(?,?,?)", [name, mail, passwordEncrypted], (err, queryRes) => {
            if (err) {
                console.log(err)
                res.send(false)

            } else {
                res.send(true)
            }

            db.end()
        })

    } else {
        res.send(false)

        db.end()
    }
})

app.post("/login", async (req, res) => {
    const mail = req.body.mail
    const password = req.body.password

    if (mail, password) {
        db.connect()
        db.query("CALL sp_medebes_users_select_mail(?)", [mail], async (err, queryRes) => {
            if (err) {
                console.log(err)

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

            db.end()
        })

    } else {
        console.log("without mail & password")
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

    console.log("hasOriginal: " + hash)
    console.log("texto: " + text)
    console.log("match: " + match)

    return match
} 