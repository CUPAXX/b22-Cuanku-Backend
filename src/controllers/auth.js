const UserModel = require('../models/users')
const tokenFCM = require('../models/tokenFCM')
const {Op} = require('sequelize')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const { validationResult } = require('express-validator')

exports.login = async (req, res) => {
  const { pin} = req.body
  const user = await UserModel.findAll({
    where: {
      phone: {
        [Op.substring]: req.body.phone
      }
    }
  })
  const result = user[0]
  if(result !== undefined){
    const compare = await bcrypt.compare(pin, result.pin)
    if(compare){
      const token = jwt.sign({id: result.id, phone: result.phone}, process.env.APP_KEY)
      return res.json({
        success: true,
        message: 'Login Success',
        resultToken: token
      })
    } else {
      return res.status(404).json({
        success: false,
        message: 'Your Pin Wrong'
      })
    }
  } else {
    return res.status(404).json({
      success: false,
      message: 'Account not found'
    })
  }
  
}

exports.register = async (req, res) => {
  const result = validationResult(req)
  if(!result.isEmpty()) {
    return res.status(500).json({
      success: false,
      message: result.errors[0].msg
    })
  }
  const data = req.body
  data.pin = await bcrypt.hash(data.pin, await bcrypt.genSalt())
  const user = await UserModel.create(data)
  return res.json({
    success: true,
    message: 'user has been create',
    results: user
  })
}

exports.registerToken = async (req, res) => {
  const {token} = req.body;
  const {id} = req.authUser;
  const [fcm, created] = await tokenFCM.findOrCreate({
    where: {
      token
    },
    defaults: {
      userId: id
    }
  })

  if(!created){
    fcm.userId = id;
    await fcm.save()
  }

  return res.json({
    success: true,
    message: 'Token saved'
  })
}