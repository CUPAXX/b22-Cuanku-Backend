const Transaction = require('../models/transaction')
const UserModel = require('../models/users')

exports.createTransaction = async (req, res) => {
  const trx = await Transaction.create(req.body)
  return res.json({
    success: true,
    message: 'Transaction SuccessFully',
    result: trx
  })
}

exports.detailTransaction = async (req, res) => {
  const {id} = req.params
  const trx = await Transaction.findByPk(id,{
    include: [
      {model: UserModel, as: 'userDetail'}
    ]
  })
  return res.json({
    success: true,
    message: 'Detail Transaction',
    result: trx
  })
}