const userModel = require('../models/user.model');
const helper = require ('../middleware/helper.js');
const string = require ('../middleware/strings.js');
const bCrypt = require('../middleware/bcrypt');

//save new user
async function saveNewUser(req,res){
    var user = req.body;

    if(user === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE)

    if(user.name === null || user.userName === null || user.password === null || user.roleId ==null ) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    //save new user  
    await userModel.validateUsername(user.userName).then(async (isExist) => {
        if(isExist[0]["isExist"] == 0){
            await bCrypt.bcryptPassword(user['password']).then( async encryptedPass =>{
                user['password'] = encryptedPass;
                await userModel.save(user).then( () => {
                    return helper.apiCallBack(res, null, string.SUCCESS_MESSAGE.save, string.SUCCESS_CODE);
                }).catch(_e => {
                    return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
                })
            }).catch(_e => {
                return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
            })
            
        } else return helper.apiCallBack(res,null,'User name already exists.', string.ERROR_500.code);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })  
}

//update user
async function updateUser(req,res){
    var user = req.body;
    if(user === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE)
    if(user.name === null || user.id === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    //update new user  
    await userModel.update(user).then( () => {
        return helper.apiCallBack(res, null, string.SUCCESS_MESSAGE.update, string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}

//find all user by role Id
async function findAllUserByRoleId(req,res){
    var roleId = req.query['roleId'];
    if(roleId === null) return helper.apiCallBack(res, null, "Role Id required to filter user" , string.INFO_CODE);
    //find all user  
    await userModel.findAllByRoleId(roleId).then( (result) => {
        return helper.apiCallBack(res, result, null , string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}

//find all user by user Id
async function findUserById(req,res){
    var id = req.query['id'];
    if(id === null) return helper.apiCallBack(res, null, "Id required to find user" , string.INFO_CODE);
    //find by id 
    await userModel.findById(id).then( (result) => {
        return helper.apiCallBack(res, result, null , string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}


//disable user
async function disableUserById(req,res){
    var id = req.query['id'];
    if(id === null) return helper.apiCallBack(res, null, "Id required to find user" , string.INFO_CODE);
    //find by id 
    await userModel.deleteById(id).then( (result) => {
        return helper.apiCallBack(res, result, string.SUCCESS_MESSAGE.delete , string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}

//disable user
async function checkIfUsernameAlreadyExistORNot(req,res){
    var username = req.query['username'];
    if(username === null) return helper.apiCallBack(res, null, "Username required to validate username" , string.INFO_CODE);
    //find by id 
    await userModel.validateUsername(username).then( (result) => {
        return helper.apiCallBack(res, result[0], null , string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}

async function getCompanyProfile(req,res){
    var id = Number(1);
    if(id === null) return helper.apiCallBack(res, null, "Id required to find user" , string.INFO_CODE);
    //find by id 
    await userModel.getCompanyDetails(id).then( (result) => {
        return helper.apiCallBack(res, result, null , string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}


module.exports = { saveNewUser, updateUser, findAllUserByRoleId, findUserById, disableUserById, checkIfUsernameAlreadyExistORNot, getCompanyProfile }