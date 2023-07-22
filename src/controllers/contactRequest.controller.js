const contactRequestModel = require('../models/contactRequest.model');
const helper = require ('../middleware/helper.js');
const string = require ('../middleware/strings.js');
const mail = require('../middleware/send.mail')
const dotenv = require('dotenv');
dotenv.config();

async function saveRequest(req,res){
    var messageData = req.body;
    if(!messageData) return helper.apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE)
    await contactRequestModel.saveNewMessage(messageData).then(()=>{
        return helper.apiCallBack(res,null,'Message sent successfully.\nYou will get callback soon.',string.SUCCESS_CODE);
    }).catch(_e=>{
        helper.apiCallBack(res,null, string.ERROR_500.message, string.ERROR_500.code)
    });
}

async function markRead(req,res){
    var id = req.query.id;
    if(!id) return helper.apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE)
    await contactRequestModel.updateMessageRead(id).then(()=>{
        return helper.apiCallBack(res,null,string.SUCCESS_MESSAGE.update,string.SUCCESS_CODE);
    }).catch(_e=>{
        helper.apiCallBack(res,null, string.ERROR_500.message, string.ERROR_500.code)
    });
}

async function markDelete(req,res){
    var id = req.query.id;
    if(!id) return helper.apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE)
    await contactRequestModel.updateMessageDelete(id).then(()=>{
        return helper.apiCallBack(res,null,string.SUCCESS_MESSAGE.delete,string.SUCCESS_CODE);
    }).catch(_e=>{
        helper.apiCallBack(res,null, string.ERROR_500.message, string.ERROR_500.code)
    });
}

async function getSearch(req,res){
    var id = req.query.id;
    var status = req.query.date;
    var date = req.query.date;
    if(!messageData) return helper.apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE)
    await contactRequestModel.getAllMessageByStatus(id,status,date).then(result=>{
        return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
    }).catch(_e=>{
        helper.apiCallBack(res,null, string.ERROR_500.message, string.ERROR_500.code)
    });
}

async function getAll(req,res){
    await contactRequestModel.getAllMessage().then(result=>{
        return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
    }).catch(_e=>{
        helper.apiCallBack(res,null, string.ERROR_500.message, string.ERROR_500.code)
    });
}

module.exports = {saveRequest, markRead, markDelete, getSearch, getAll}



