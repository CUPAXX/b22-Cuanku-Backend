
const auth = require('express').Router()
const { login, register } = require('../controllers/auth')
const {checkSchema} = require('express-validator')


auth.post('/login', login)
auth.post('/register', checkSchema(require('../helpers/validator/register')) ,register)


module.exports = auth