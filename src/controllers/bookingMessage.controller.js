const bookingMessageModel = require('../models/bookingMessage.model');
const mail = require('../middleware/send.mail');
const helper = require ('../middleware/helper.js');
const string = require ('../middleware/strings.js');
const dotenv = require('dotenv');
dotenv.config();

async function getAllMessage(req,res){
    bookingMessageModel.getAllUnreadMessage().then(result =>{
        if(result.length>0){
            return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
        } else return helper.apiCallBack(res,null,string.SUCCESS_MESSAGE.noMessage,string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

async function saveMessage(req,res){
    var messageData = req.body;
    var adminMail = process.env.TO_ADMIN_MAIL
    if(!messageData || Object(messageData).length === 0) return apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    //console.log(!adminMail,!messageData.fromDate , !messageData.toDate , !messageData.categoryId , !messageData.typeId , !messageData.noOfRooms , !messageData.noOfAdultGuest , !messageData.name , !messageData.email , !messageData.mobile , !messageData.identificationType , !messageData.identificationNumber)
    if(!messageData.fromDate || !messageData.toDate || !messageData.categoryId || !messageData.typeId || !messageData.noOfRooms || !messageData.noOfAdultGuest || !messageData.name || !messageData.email || !messageData.mobile || !messageData.identificationType || !messageData.identificationNumber) return apiCallBack(res,null,REQUIRED_FIELDS,INFO_CODE);
    bookingMessageModel.saveNewMessage(messageData).then(async()=>{
        //toMail,fullName,userEmail,mobile,arrivalDate,departureDate,numberOfRooms,roomCategory,roomType,numberOfAdults,NumberOfChildrens
        await mail.requestBookingMail(adminMail, messageData.name, messageData.email, messageData.fromDate , messageData.toDate, messageData.noOfRooms, )
        return helper.apiCallBack(res,null,'Your request has been succesfully sent. \nYou will soon receive a call back. \nThank You.',string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

async function updateMessage(req,res){
    var messageData = req.body;
    if(!messageData || Object(messageData).length === 0) return apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    bookingMessageModel.updateMessage(messageData).then(()=>{
        return helper.apiCallBack(res,null,null,string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

async function readMessage(req,res){
    var id = req.query['id'];
    bookingMessageModel.updateMessageRead(id).then(()=>{
        return helper.apiCallBack(res,null,null,string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

async function deleteMessage(req,res){
    var id = req.query['id'];
    if(!id || id === 0) return apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    bookingMessageModel.deleteMessage(id).then(()=>{
        return helper.apiCallBack(res,null,null,string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

async function searchMessage(req,res){
    let { mobileNo, fullName, email } = req.query
    if(mobileNo == null) {
        mobileNo = '%%'
    }else mobileNo = "'%" + mobileNo + "%'"

    // if(fullName == null) {
    //     fullName = '%%'
    // }else fullName = "'" + fullName + "%'"

    // if(email == null) {
    //     email = '%%'
    // }else email = "'" + email + "%'"
    
    if(!mobileNo && !fullName && !email) return apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);

    bookingMessageModel.searchMessageByMobile(mobileNo,fullName,email).then(result=>{
        if(result.length>0){
            return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
        } else return helper.apiCallBack(res,null,string.SUCCESS_MESSAGE.noMessage,string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

async function getCountUnreadMessage(req,res){
    bookingMessageModel.countNewMessages().then(result =>{
        if(result.length>0){
            return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
        } else return helper.apiCallBack(res,null,string.SUCCESS_MESSAGE.noMessage,string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}


module.exports = {getAllMessage,saveMessage,updateMessage,deleteMessage,searchMessage,getCountUnreadMessage,readMessage}

