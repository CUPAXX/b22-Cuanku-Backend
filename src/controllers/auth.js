const UserModel = require('../models/users')
const {Op} = require('sequelize')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const { validationResult } = require('express-validator')

exports.login = async (req, res) => {
  const {email, pin} = req.body
  const user = await UserModel.findAll({
    where: {
      email: {
        [Op.substring]: req.body.email
      }
    }
  })
  const result = user[0]
  const compare = await bcrypt.compare(pin, result.pin)
  if(compare){
    const token = jwt.sign({id: result.id, email: result.email}, process.env.APP_KEY, { expiresIn: '30m' })
    return res.json({
      success: true,
      message: 'Login Success',
      resultToken: token
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