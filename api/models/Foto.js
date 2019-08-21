module.exports = {

  attributes: {
    id: { type: 'number', autoIncrement: true },
    url: { type: 'string' },
    producto: {model: 'producto'}
  },
  primaryKey: 'id'

};

