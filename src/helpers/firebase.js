const admin = require('firebase-admin');
const serviceAccount = require('../config/projectcoba-99-firebase-adminsdk-9jnjc-2c584e3cd0.json');

const firebase = admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

module.exports = firebase;