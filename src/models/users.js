const Sequelize = require('sequelize')
const sequelize = require('../config/sequelize')

const User = sequelize.define('users', {
  email: Sequelize.STRING,
  pin: Sequelize.STRING,
  balance: Sequelize.INTEGER,
  name: Sequelize.STRING,
  phone: Sequelize.STRING,
  picture: Sequelize.STRING
})

module.exports = User