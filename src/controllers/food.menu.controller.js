const FoodMenuModel = require('../models/food.menu.model')
const dotenv = require('dotenv');
const helper = require ('../middleware/helper.js');
const string = require ('../middleware/strings.js');
const { apiCallBack } = helper;
const {SUCCESS_CODE,SUCCESS_MESSAGE,REQUIRED_FIELDS,ERROR_500,INFO_CODE} = string;
dotenv.config();


//get all food menu list
async function getFoodMenuList(req,res){
    var type = req.query.type;
    var isClient = req.query.isClient;
    if(!type) return apiCallBack(res,null,'Please select',INFO_CODE);
    await FoodMenuModel.getAllFoodMenu(type,isClient).then(result=>{
        if(result.length == 0) return apiCallBack(res,null,'No item found.',INFO_CODE);
        return apiCallBack(res,result,null,SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message,ERROR_500.code);
    });
}

//get all food menu list search
async function getFoodMenuListSearch(req,res){
    var name = req.query.name;
    await FoodMenuModel.searchAllFoodMenu(name).then(result=>{
        if(result.length == 0) return apiCallBack(res,result,'No Data Found',INFO_CODE);
        return apiCallBack(res,result,null,SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message,ERROR_500.code);
    });
}


// get food menu by ID
async function getFoodMenuById(req,res){
    var id = req.query.id;
    if(!id || id==0) return apiCallBack(res,null,'No Food Menu',INFO_CODE);
    await FoodMenuModel.getFoodMenuByIds(id).then(result=>{
        if(result.length>0){
            return apiCallBack(res,result[0],null,SUCCESS_CODE);
        }
        else return apiCallBack(res,null,'No Data found',string.INFO_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message,ERROR_500.code);
    });
}

// create new food menu
async function createNewFoodMenu(req,res){
    var foodMenuData = req.body;
    if(!foodMenuData || Object(foodMenuData).length === 0) return apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    if(!foodMenuData.title || !foodMenuData.type) return apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    await FoodMenuModel.createFoodMenu(foodMenuData).then(()=>{
        return apiCallBack(res,null,SUCCESS_MESSAGE.save,SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message,ERROR_500.code);
    });
}

// update food menu
async function updateFoodMenu(req,res){
    var foodMenuData = req.body;
    if(!foodMenuData || Object(foodMenuData).length === 0) 
    return apiCallBack(res,null,REQUIRED_FIELDS,INFO_CODE);
    if(!foodMenuData.id || !foodMenuData.title || !foodMenuData.type) return apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    await FoodMenuModel.updateFoodMenus(foodMenuData).then(()=>{
        return apiCallBack(res,null,SUCCESS_MESSAGE.update,SUCCESS_CODE);
    }).catch(_e=>{
        return apiCallBack(res,null,ERROR_500.message,ERROR_500.code);
    });
}


// delete food menu
async function deleteFoodMenu(req,res){
    var id = req.query.id;
    if(!id || id==0) return apiCallBack(res,null,'Id cannot be Zero',INFO_CODE);
    await FoodMenuModel.deleteFoodMenu(id).then(()=>{
        return apiCallBack(res,null,SUCCESS_MESSAGE.delete,SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    })
}


module.exports = {createNewFoodMenu, getFoodMenuList, getFoodMenuById, updateFoodMenu, deleteFoodMenu, getFoodMenuListSearch};