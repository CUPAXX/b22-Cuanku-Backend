
const Sequelize = require('sequelize')
const sequelize = require('../config/sequelize')
const UserModel = require('./users')

const Transaction = sequelize.define('transaction', {
  userId: Sequelize.INTEGER,
  refNo: Sequelize.STRING,
  phoneRecipient: Sequelize.STRING,
  amount: Sequelize.INTEGER,
  description: Sequelize.STRING,

})

Transaction.belongsTo(UserModel, {foreignKey: 'userId', sourceKey: 'id', as: 'userDetail'})

module.exports = Transaction