var admin = require("firebase-admin");

var serviceAccount = require("../../utils/eficar-3b4a3-firebase-adminsdk-c8mzu-676acaad56.json");

module.exports = admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://eficar-3b4a3.firebaseio.com/"
});