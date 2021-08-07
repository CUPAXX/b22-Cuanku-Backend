const mysql = require('mysql2') // PASTIKAN MENGGUNAKAN MYSQL2
require('dotenv').config() 
const connection = mysql.createConnection({
 host: process.env.DB_HOST,
 port: process.env.APP_PORT,
 user: process.env.DB_USER,
 password: process.env.DB_PASS,
 database: process.env.DB_NAME
})
 
connection.connect((error) => {
 if (error) {
   throw error
 }
 console.log('You are now conected ...')
})
 
module.exports = connection