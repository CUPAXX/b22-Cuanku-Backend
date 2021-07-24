
const auth = require('express').Router()
const { login, register, registerToken } = require('../controllers/auth')
const {checkSchema} = require('express-validator')
const authMiddleware = require('../middlewares/auth')


auth.post('/login', login)
auth.post('/register', checkSchema(require('../helpers/validator/register')) , register)
auth.post('/registerToken', authMiddleware, registerToken)

module.exports = auth