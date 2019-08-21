var jwt = require("jsonwebtoken");
var bcrypt = require("bcrypt");

module.exports = {

  login: function (req, res) {

   
    if (!_.has(req.body, 'email') || !_.has(req.body, 'password')) {
      return res.serverError("No field should be empty.");
    }


    Usuario.findOne({
      email: req.body.email
    }).populate("persona").exec(function callback(err, user) {
      if (err) return res.serverError(err);

      if (!user) return res.serverError("User not found, please sign up.");



      bcrypt.compare(req.body.password, user.password, function (error, matched) {
        if (error) return res.serverError(error);

        if (!matched) return res.serverError("Invalid password.");

        var token = jwt.sign(JSON.parse(JSON.stringify(user)), "this is my secret key", {
          expiresIn: '1000m',
          
        });

        res.ok({token: token, user:user});
      });

    });
  },

  /**
   * this is used to request for another token when the other token is about
   * expiring so for next request call the token can be validated as true
   * GET /token
   * @param req
   * @param res
   */
  token: function (req, res) {
    Usuario.findOne(req.user.id).exec(function callback(error, user) {
      if (error) return res.serverError(error);
      if (!user) return res.serverError("User not found");

      var token = jwt.sign(user.toJSON(), "this is my secret key", {
        expiresIn: '10m'
      });
      res.ok(token);
    });
  }
};