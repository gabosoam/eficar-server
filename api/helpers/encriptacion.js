const bcrypt = require('bcrypt');

module.exports = {
  friendlyName: 'Encriptación',
  description: 'Helper para encriptar texto',
  inputs: {
    texto: {
      type: 'string',
      example: '12345Abc',
      description: 'Texto a encriptar',
      required: true
    }
  },
  exits: {
    success: {
      description: 'All done.',
    },
  },
  fn: async function (inputs, exits) {
  
    var result = bcrypt.hashSync(inputs.texto,10);
    return exits.success(result);
  }


};
