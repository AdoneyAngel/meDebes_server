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
           res.send(queryRes.data[0]) 
        }  
    })
})

app.post("/getUserByName", (req, res) => {
    const name = req.body.name

    if (name) {
        db.query("CALL sp_medebes_users_select_name(?)", [name], (err, queryRes) => {
            if (err) {
                console.log(err)

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

        } else {
            res.send(queryRes)
        }
      })  
    }
    
})