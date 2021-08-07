const Transaction = require('../models/transaction')
const UserModel = require('../models/users')
const { Op } = require('sequelize')
const { APP_URL } = process.env

exports.createTransaction = async (req, res) => {
  const trx = await Transaction.create(req.body)
  return res.json({
    success: true,
    message: 'Transaction SuccessFully',
    result: trx
  })
}

exports.mobileTopup = async (req, res) => {
  const date = new Date()
  const desc = 'Mobile topup'
  const user = await UserModel.findByPk(req.authUser.id)
  if(user.balance < req.body.balance){
    return res.status(500).json({
      success: false,
      message: `your money is not enough`
    })
  }
  if(req.body.balance < 10000){
      return res.status(500).json({
      success: false,
      message: `minimum mobile topup 10000`,
    })
  }
  const trx = await Transaction.create({
    userId: req.authUser.id,
    refNo: date.getTime(),
    amount: req.body.balance,
    description: desc,
    phoneRecipient: req.body.phone
  })
  user.decrement('balance', {by: req.body.balance})
  return res.json({
    success: true,
    message: 'Mobile Topup SuccessFully',
    result: trx
  })
}

// exports.detailTransaction = async (req, res) => {
//   const trx = await Transaction.findByPk(req.authUser.id,{
//     include: [
//       {model: UserModel, as: 'userDetail'}
//     ]
//   })
//   return res.json({
//     success: true,
//     message: 'Detail Transaction',
//     result: trx
//   })
// }

exports.detailTransaction = async (req, res) => {
  let { search = '', sort, limit = 6, page = 1 } = req.query
  const order = []
  if (typeof sort === 'object') {
    const key = Object.keys(sort)[0]
    let value = sort[key]
    if (value === '1') {
      value = 'DESC'
    } else {
      value = 'ASC'
    }
    order.push([key, value])
  }
  if (typeof limit === 'string') {
    limit = parseInt(limit)
  }
  if (typeof page === 'string') {
    page = parseInt(page)
  }
  const count = await Transaction.count({
    where: {
      userId: {
        [Op.substring]: req.authUser.id
      }
    }
  })
  const nextPage = page < Math.ceil(count / limit) ? `${APP_URL}/transaction?page=${page + 1}` : null
  const prevPage = page > 1 ? `${APP_URL}/transaction?page=${page - 1}` : null
  const trx = await Transaction.findAll({
    where: {
      description: {
        [Op.substring]: search
      },
      userId: {
        [Op.substring]: req.authUser.id
      }
    },
    order,
    limit,
    offset: (page - 1) * limit
  })
  // const trx = await Transaction.findAll({
  //   where: {
  //     userId: {
  //       [Op.substring]: req.authUser.id
  //     }
  //   }
  // })
  if (trx) {
    return res.json({
      success: true,
      message: 'History transaction',
      results: trx,
      pageInfo: {
        totalData: count,
        totalPage: Math.ceil(count / limit),
        currentPage: page,
        nextLink: nextPage,
        prevLink: prevPage
      }
    })
  } else {
    return res.status(404).json({
      success: false,
      message: 'Id not found'
    })
  }
}