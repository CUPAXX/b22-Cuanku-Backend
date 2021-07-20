
const transaction = require('express').Router()
const { createTransaction, detailTransaction, mobileTopup } = require('../controllers/transaction')
const auth  = require('../middlewares/auth')

// transaction.patch('/:id', updateUser)
// transaction.delete('/:id', deleteUser)
transaction.get('/', auth, detailTransaction)
transaction.post('/', createTransaction)
transaction.post('/mobileTopup', auth, mobileTopup)
// transaction.get('/', listUser)


module.exports = transaction