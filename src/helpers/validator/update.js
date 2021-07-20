module.exports = {
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
