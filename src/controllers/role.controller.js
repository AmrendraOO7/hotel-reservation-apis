const roleModel = require('../models/role.model.js');
const helper = require ('../middleware/helper.js');
const string = require ('../middleware/strings.js');
const bCrypt = require('../middleware/bcrypt');

//save new Role
async function saveNewRole(req,res){
    var role = req.body;
    if(role === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE)

    if(role.name === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    //save new role  
    await roleModel.validateRolename(role.roleName).then(async (isExist) => {
        if(isExist[0]["isExist"] == 0){
            await roleModel.save(role).then( () => {
                return helper.apiCallBack(res, null, string.SUCCESS_MESSAGE.save, string.SUCCESS_CODE);
            }).catch(_e => {
                return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
            });
        } else return helper.apiCallBack(res,null,'role name already exists.', string.ERROR_500.code);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })  
}

//update role
async function updateRole(req,res){
    var role = req.body;
    if(role === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE)
    if(role.name === null || role.id === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    //update new role  
    await roleModel.update(role).then( () => {
        return helper.apiCallBack(res, null, string.SUCCESS_MESSAGE.update, string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}

//find all role by role Id
async function getAllRole(req,res){
    //find all role  
    await roleModel.findAllRole().then( (result) => {
        return helper.apiCallBack(res, result, null , string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}

//find all role by role Id
async function findRoleById(req,res){
    var id = req.query['id'];
    if(id === null) return helper.apiCallBack(res, null, "Id required to find role" , string.INFO_CODE);
    //find by id 
    await roleModel.findById(id).then( (result) => {
        return helper.apiCallBack(res, result[0], null , string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}


//disable role
async function disableRoleById(req,res){
    var id = req.query['id'];
    if(id === null) return helper.apiCallBack(res, null, "Id required to delete role" , string.INFO_CODE);
    //find by id 
    await roleModel.deleteById(id).then( (result) => {
        return helper.apiCallBack(res, result, null , string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}

//disable role
async function checkIfRolenameAlreadyExistORNot(req,res){
    var rolename = req.query['rolename'];
    if(rolename === null) return helper.apiCallBack(res, null, "Rolename required to validate rolename" , string.INFO_CODE);
    //find by id 
    await roleModel.validateRolename(rolename).then( (result) => {
        return helper.apiCallBack(res, result[0], null , string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}


module.exports = { saveNewRole, updateRole, getAllRole, findRoleById, disableRoleById, checkIfRolenameAlreadyExistORNot }