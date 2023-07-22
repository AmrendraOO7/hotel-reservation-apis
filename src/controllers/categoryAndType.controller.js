const categoryAndTypeModel = require('../models/categoryAndType.model')
var converter = require('number-to-words');
const {requestBookingMail} = require('../middleware/send.mail');
const { apiCallBack } = require('../middleware/helper');
const { SUCCESS_CODE, ERROR_500, REQUIRED_FIELDS, INFO_CODE } = require('../middleware/strings');


async function roomCategoryOrType(req,res){
    const tableName = req.query['tableName'];
    if(!tableName || Object.keys(tableName).length == 0)  return apiCallBack(res, null, REQUIRED_FIELDS, INFO_CODE);
    await categoryAndTypeModel.getAllRoomCategoryOrType(tableName).then( result => {
        return apiCallBack(res, result, null, SUCCESS_CODE);
    }).catch(_e=>{
        return apiCallBack(res, null, ERROR_500.message, ERROR_500.code);
    });
}

async function roomCategoryOrTypeById(req,res){
    const tableName = req.query['tableName'];
    const id = req.query['id'];
    if(!tableName || Object.keys(tableName).length == 0)  return apiCallBack(res, null, REQUIRED_FIELDS, INFO_CODE);
    await categoryAndTypeModel.getAllRoomCategoryOrTypeById(tableName,id).then( result => {
        return apiCallBack(res, result, null, SUCCESS_CODE);
    }).catch(_e=>{
        return apiCallBack(res, null, ERROR_500.message, ERROR_500.code);
    });
}

async function mailCheck(req,res){

    var mailData = req.body;
    if(!mailData || Object.keys(mailData).length == 0)  return apiCallBack(res, null, REQUIRED_FIELDS, INFO_CODE);
    await requestBookingMail(mailData.toMail,mailData.fullName,mailData.userEmail,mailData.mobile,mailData.arrivalDate,mailData.departureDate,mailData.numberOfRooms,mailData.roomCategory,mailData.roomType,mailData.numberOfAdults,mailData.NumberOfChildrens).then( result => {
        return apiCallBack(res, null, 'Mail sent successfuly', SUCCESS_CODE);
    }).catch(_e=>{
        return apiCallBack(res, null, ERROR_500.message, ERROR_500.code);
    });
}

async function convertToWOrd(req,res){
    var numeric =req.query.inWords;
    var inWords = await converter.toWords(numeric);
    return apiCallBack(res, inWords, null, null);
  }

module.exports = {roomCategoryOrType,roomCategoryOrTypeById,mailCheck, convertToWOrd, convertToWOrd};