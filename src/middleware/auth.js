const pkg = require('jsonwebtoken');
const { verify } = pkg;
const UserModel = require('../models/user.model.js');
const helper =  require('../middleware/helper.js');
const {  apiCallBack } = helper;
const string = require('../middleware/strings.js');

async function auth (req, res, next) {
  let token = req.query.token;
  if (token) {
    try {
      // Verify Token
       const { userId }  = verify(token, process.env.JWT_SECRET_KEY);
      //Get User from Token
      await UserModel.findById(userId).then((result) => {
        if(result) next();
        else return apiCallBack(res, null,string.Access_denied.message, string.Access_denied.code);
      }).catch(_e => {
         return apiCallBack(res, null, string.Access_denied.message , string.Access_denied.code); 
      })
    } catch (error) {
       return apiCallBack(res, null, string.Access_denied.message , string.Access_denied.code); 
    }
  } else {
      return apiCallBack(res, null, string.Access_denied.message , string.Access_denied.code); 
  }
}
    
module.exports = { auth };