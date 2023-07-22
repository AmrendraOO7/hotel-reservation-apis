const helper = require("../middleware/helper");
const string = require("../middleware/strings");
const userModel = require('../models/user.model');
const bCrypt = require("../middleware/bcrypt");
const jwt = require("../middleware/jwt");

//for client login
async function loginCustomer(req, res) {
    var data = req.body;
    var username = data['userName'];
    var password = data['password'];
    if(!username || !password) return helper.apiCallBack(res, null, "Enter username and password to login.", string.INFO_CODE);
    await userModel.getOneCustomerByUsername(username, 'customer').then(async result => {
        if(result.length > 0){
        var dataPassword = result[0]['password'];
        var id = result[0]['id'];
        return login(password, dataPassword, id ,res);
       }else return helper.apiCallBack(res, null, string.INVALID_PASSWORD, string.INFO_CODE);
    }).catch(e => {
        return helper.apiCallBack(res, null, string.ERROR_500.message, string.ERROR_500.code);
    })  
}

//for admin login
async function adminLogin(req, res) {
    var data = req.body;
    var username = data['userName'];
    var password = data['password'];
    if(!username || !password) return helper.apiCallBack(res, null, "Enter username and password to login.", string.INFO_CODE);
    await userModel.getOneAdminByUsername(username, 'customer').then(async(result) => {
       if(result.length > 0){
        var dataPassword = result[0]['password'];
        var id = result[0]['id'];
        return login(password, dataPassword, id, res);
       }else return helper.apiCallBack(res, null, string.INVALID_PASSWORD, string.INFO_CODE);
    }).catch(e => {
        return helper.apiCallBack(res, null, string.ERROR_500.message, string.ERROR_500.code);
    })    
    
}

async function login(password, dataPassword, id, res){
     /* Login handle here  */
    if(dataPassword) {
        var isPasswordMatched = await bCrypt.checkUser(password, dataPassword);
        if(isPasswordMatched) {
            await jwt.generateJWTToken(Number(id)).then( async (token) => {
                if(token){
                    await userModel.findById(Number(id)).then(user => {
                        let body = {
                        token: token,
                        id: user[0]['id'],
                        user: user[0]
                        } 
                        return helper.apiCallBack(res, body, null, string.SUCCESS_CODE);                           
                    }).catch(_e => {
                        return helper.apiCallBack(res, null, string.ERROR_500.message, string.ERROR_500.code); 
                    })
                }else return helper.apiCallBack(res,null,'Failed to generate token contact support team.',ERROR_500.code)  
            }).catch(_e => {
                return helper.apiCallBack(res, null, string.ERROR_500.message, string.ERROR_500.code);
            });
        } else return helper.apiCallBack(res, null, string.INVALID_PASSWORD, string.INFO_CODE);
    } else {
        return helper.apiCallBack(res, null, string.INVALID_USER, string.INFO_CODE)
    }
}

module.exports = { loginCustomer, adminLogin }