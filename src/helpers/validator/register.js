module.exports = {
  phone: {
    in: ['body'],
    isLength: {
      errorMessage: 'phone number length min 11 character',
      options: {
        min: 11
      }
    }
  },
  pin: {
    in: ['body'],
    isLength: {
      errorMessage: 'Pin length min & max 6 character',
      options: {
        min: 6,
        max: 6
      }
    }
  }
}
