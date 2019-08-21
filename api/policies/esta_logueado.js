
var jwt = require("jsonwebtoken");

module.exports = function (req, res, next) {
  var bearerToken;
  var bearerHeader = req.headers["authorization"];
  if (typeof bearerHeader !== 'undefined') {
    
    jwt.verify(bearerHeader, "this is my secret key", function (err, decoded) {
      if (err) {
        sails.log("verification error", err);
        if (err.name === "TokenExpiredError")        
          return res.forbidden("Session timed out, please login again");
        else
          return res.forbidden("Error authenticating, please login again");
      }

      Usuario.findOne(decoded.id).exec(function callback(error, user) {
        if (error) return res.serverError(err);

        if (!user) return res.serverError("User not found");

        req.user = user;
        next();
      });

    });

  } else {
       
    return res.forbidden("No token provided");
  }
};