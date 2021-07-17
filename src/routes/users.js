
const users = require('express').Router()
const { createUser, updateUser, deleteUser, listUser, detailUser, topupUser } = require('../controllers/users')
const itemPicture = require('../helpers/upload').single('picture')
const auth  = require('../middlewares/auth')

users.patch('/', auth, itemPicture, updateUser)
users.delete('/:id', deleteUser)
users.get('/:id', detailUser)
users.post('/', createUser)
users.get('/', listUser)
users.patch('/topup', auth, topupUser)


module.exports = users