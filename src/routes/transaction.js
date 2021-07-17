
const transaction = require('express').Router()
const { createTransaction, detailTransaction } = require('../controllers/transaction')


// transaction.patch('/:id', updateUser)
// transaction.delete('/:id', deleteUser)
transaction.get('/:id', detailTransaction)
transaction.post('/', createTransaction)
// transaction.get('/', listUser)


module.exports = transaction