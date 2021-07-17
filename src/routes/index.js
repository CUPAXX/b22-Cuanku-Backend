
const router = require('express').Router()

const transaction = require('./transaction')
const users = require('./users')
const auth = require('./auth')


router.use('/users', users)
router.use('/transaction', transaction)
router.use('/auth', auth)

module.exports = router