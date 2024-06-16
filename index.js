require("dotenv").config()

const mysql = require("mysql")
const express = require("express")
const cors = require("cors")

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

        } else {
           res.send(queryRes[0]) 
        }  
    })
})

app.get("/getUserByMail", (req, res) => {
    const mail = req.body.mail

    console.log("llamado")

    if (mail) {
      db.query("CALL sp_medebes_users_select_mail("+mail+")", (err, queryRes) => {
        if (err) {
            console.log(err)

        } else {
            res.send(queryRes)
        }
      })  
    }
    
})