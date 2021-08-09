const UserModel = require('../models/users')
const {Op} = require('sequelize')
const bcrypt = require('bcrypt')
const Transaction = require('../models/transaction')
const TokenFCM = require('../models/tokenFCM')
const firebase = require('../helpers/firebase')

exports.createUser = async (req, res) => {
  const data = req.body
  data.pin = await bcrypt.hash(data.pin, await bcrypt.genSalt())
  const user = await UserModel.create(data)
  return res.json({
    success: true,
    message: 'user has been create',
    results: user
  })
}

exports.updateUser = async (req, res) => {
  
  const user = await UserModel.findByPk(req.authUser.id)
  if(user){
    if(Object.keys(req.body).includes('pin')){
      if(req.file){
        req.body.picture = req.file ? `${process.env.APP_UPLOAD_ROUTE}/${req.file.filename}` : null
        const data = req.body
        data.pin = await bcrypt.hash(data.pin, await bcrypt.genSalt())
        user.set(data)
        await user.save()
        return res.json({
        success: true,
        message: 'User Update Successfully',
        results: user
        })
      } else {
        const data = req.body
        data.pin = await bcrypt.hash(data.pin, await bcrypt.genSalt())
        user.set(data)
        await user.save()
        return res.json({
        success: true,
        message: 'User Update Successfully',
        results: user
        })
      }
      
    }else {
      if(req.file){
        req.body.picture = req.file ? `${process.env.APP_UPLOAD_ROUTE}/${req.file.filename}` : null
        user.set(req.body)
        await user.save()
        return res.json({
        success: true,
        message: 'User Update Successfully',
        results: user
        })
      }else {
        const data = req.body
        user.set(data)
        await user.save()
        return res.json({
        success: true,
        message: 'User Update Successfully',
        results: user
        })
      }
      
    }
   
  } else{
    return res.status(404).json({
      success: false,
      message: 'User Not Found'
    })
  }
}

exports.deleteUser = async (req, res) => {
  const {id} = req.params
  const user = await UserModel.findByPk(id)
  await user.destroy()
  return res.json({
    success: true,
    message: 'User Has Been Deleted',
    resutls: user
  })
}

exports.listUser = async (req, res) => {
  let {search='', sort, limit=5, page=1} = req.query
  let order =[]
  if(typeof sort === 'object'){
    const key = Object.keys(sort)[0]
    let value = sort[key]
    if(value === '1'){
      value = 'DESC'
    }else {
      value = 'ASC'
    }
    order.push([key, value])
  }
  if(typeof limit === 'string'){
    limit = parseInt(limit)
  }
  if(typeof page === 'string'){
    page = parseInt(page)
  }
  const user = await UserModel.findAll({
    where: {
      name: {
        [Op.substring]: search
      }
    },
    attributes: {exclude: ['pin']},
    order,
    limit,
    offset: (page-1) * limit
  })
  const count = await UserModel.count()
  return res.json({
    success: true,
    message: 'List User',
    results: user,
    pageInfo: {
      totalPage: Math.ceil(count/limit),
      currentPage: page,
      limitData: limit,
      nextLink: null,
      prevLink: null
    }
  })
}

exports.detailUser = async (req, res) => {
  const user = await UserModel.findByPk(req.authUser.id)
  return res.json({
    success: true,
    message: "Detail User",
    results: user
  })
}

exports.topupUser = async (req, res) => {
  const date = new Date()
  const desc = 'Top up balance'
  const user = await UserModel.findByPk(req.authUser.id)
  if(req.body.balance < 1000){
    return res.status(500).json({
      success: false,
      message: 'Minimum Topup 1000',
      })
  }
  const trx = await Transaction.create({
    userId: req.authUser.id,
    refNo: date.getTime(),
    amount: req.body.balance,
    description: desc,
    phoneRecipient: user.phone
  })
  user.increment('balance', {by: req.body.balance})
  // user.set({'balance': user.balance - req.body.balance})
  await user.save()
  return res.json({
    success: true,
    message: 'Topup Successfully',
    results: trx
    })
}

exports.createTransfer = async (req,res) => {
  const date = new Date()
  const desc = 'Transfer balance'
  const user = await UserModel.findByPk(req.authUser.id)
  if(user.balance < req.body.balance){
    return res.status(500).json({
      success: false,
      message: `your money is not enough`
    })
  }
  if(req.body.balance < 1000){
    return res.status(500).json({
      success: false,
      message: `minimum transfer 1000`,
    })
  }
  const {phoneRecipient} = req.body
  const anotherUser = await UserModel.findOne({
    where: {
      phone: phoneRecipient
    },
    include: TokenFCM
  })
  if(anotherUser === null || anotherUser === undefined){
    return res.status(500).json({
      success: false,
      message: `Transfer Destination Not Found`,
    })
  }
  const trx = await Transaction.create({
    userId: req.authUser.id,
    refNo: date.getTime(),
    amount: req.body.balance,
    description: desc,
    phoneRecipient: phoneRecipient
  })
  anotherUser.increment('balance', {by: req.body.balance})
  user.decrement('balance', {by: req.body.balance})
  await user.save()

  if(anotherUser.tokenFCM !== null){
    firebase.messaging().sendToDevice(anotherUser.tokenFCM.token, {
      notification: {
        title: 'Transfer CUANKU',
        body: `${user.name} mengirimkan dana sebesar ${Number(req.body.balance).toLocaleString('en')} melalui aplikasi CUANKU`
      }
    })
  }

  return res.json({
    success: true,
    message: 'Transfer successfully',
    results: trx
  })
}

exports.userPin = async (req, res) => {
  const { pin} = req.body
  const user = await UserModel.findByPk(req.authUser.id)
  const result = user
  const compare = await bcrypt.compare(pin, result.pin)
  if(compare){
    return res.json({
      success: true,
      message: 'Pin Match'
    })
  } else {
    return res.status(404).json({
      success: false,
      message: 'Your Pin Wrong'
    })
  }
}