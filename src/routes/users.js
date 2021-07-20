
const users = require('express').Router()
const { createUser, updateUser, deleteUser, listUser, detailUser, topupUser, createTransfer, userPin } = require('../controllers/users')
const itemPicture = require('../helpers/upload').single('picture')
const auth  = require('../middlewares/auth')
const {checkSchema} = require('express-validator')

users.patch('/', auth, itemPicture, updateUser)
users.delete('/:id', deleteUser)
users.get('/detail', auth, detailUser)
users.post('/oldPin', auth, userPin)
users.post('/', createUser)
users.get('/', listUser)
users.patch('/topup', auth, topupUser)
users.post('/transfer', auth, createTransfer)


module.exports = users