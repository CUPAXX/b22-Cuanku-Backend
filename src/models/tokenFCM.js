const Sequelize = require('sequelize')
const sequelize = require('../config/sequelize')
const UserModel = require('./users')

const tokenFCM = sequelize.define('tokenFCM', {
  userId: Sequelize.INTEGER,
  token: Sequelize.STRING,
})

tokenFCM.belongsTo(UserModel, {foreignKey: 'userId', sourceKey: 'id'})
UserModel.hasOne(tokenFCM)

module.exports = tokenFCM