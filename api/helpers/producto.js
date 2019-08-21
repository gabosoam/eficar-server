module.exports = {


  friendlyName: 'Producto',


  description: 'Producto something.',


  inputs: {

  },


  exits: {

    success: {
      description: 'All done.',
    },

  },


  fn: async function (id, exists) {

   
    
 
 await Producto.find({id:id}).exec(function cb(err, res){
      if(err){

        return exists.success(id);
      }else{
   
        return exists.success(res);
      }
    })

  }


};

