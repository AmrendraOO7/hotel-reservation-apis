const roomBillModel = require('../models/roomBill.model');
const helper = require ('../middleware/helper.js');
const string = require ('../middleware/strings.js');
const mail = require('../middleware/send.mail')
const dotenv = require('dotenv');
var converter = require('number-to-words');
dotenv.config();




async function  getBillSearch(req,res){
    var mobile = req.query['mobile'];
    var roomNo = req.query['roomNo'];
    if(!mobile && !roomNo) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    await roomBillModel.getBillMasterBySearch(roomNo,mobile).then(result=>{
        if(result.length>0) return helper.apiCallBack(res,result,null, string.SUCCESS_CODE);
        else return helper.apiCallBack(res,null,'No Bill Found', string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

async function getBillMaster(req,res){
    var id = req.query['roomBookingId'];
    //var roomNo = req.query['roomNo'];
    if(!id) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    await roomBillModel.getBillMasterById(id).then(result=>{
        if(result.length>0) return helper.apiCallBack(res,result[0],null, string.SUCCESS_CODE);
        else return helper.apiCallBack(res,null,null, string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

async function getBillItems(req,res){
    var id = req.query['id'];
    if(!id) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    await roomBillModel.getBillDetailsById(id).then(result=>{
        return helper.apiCallBack(res,result,null, string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

async function getAccount(req,res){
    var id = req.query['id'];
    if(!id) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    await roomBillModel.checkAccountById(id).then(result=>{
        return helper.apiCallBack(res,result[0],null, string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

async function openAccount(req,res){
    var accountData = req.body;
    if(!accountData) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    await roomBillModel.saveBill(accountData).then(result=>{
        if(result.length>0) return helper.apiCallBack(res,result,string.SUCCESS_CODE.save, string.SUCCESS_CODE);
        else return helper.apiCallBack(res,null,'No Bill details Found', string.SUCCESS_CODE);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

//bill save 
async function saveNewBill(req,res){
    var billMaster = req.body;
    //var billDetails = req.body;
    var items = billMaster.itemName.length;

    if(billMaster === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    //accoubnt will be updated in master while saving the bill.
    await roomBillModel.masterBillUpdate(billMaster).then(async ()=>{
            var id = billMaster.id;
            //var items = billMaster.items;    
            if(id > 0) 
            {
                if(items > 0){
                    await roomBillModel.deleteBillDetails(id).then(async ()=>{
                        for(var i=0; i<items; i++){
                            itemName = billMaster.itemName[i];
                            quantity = billMaster.quantity[i];
                            rate = billMaster.rate[i];
                            itemPrice = billMaster.itemPrice[i];
                            discPcItem = billMaster.discPcItem[i];
                            discAmtItem = billMaster.discAmtItem[i];
                            totalItem = billMaster.totalItem[i];
                            //console.log(i,':',id,itemName,rate,quantity,itemPrice,discPcItem,discAmtItem,totalItem)
                            await roomBillModel.saveBillDetails(id,itemName,rate,quantity,itemPrice,discPcItem,discAmtItem,totalItem).then(()=>{
                            }).catch(_e => {
                                return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
                            });
                        }
                        return helper.apiCallBack(res,null,string.SUCCESS_MESSAGE.save,string.SUCCESS_CODE);
                        //return helper.apiCallBack(res,isDeleted,string.SUCCESS_MESSAGE.save, string.SUCCESS_CODE);
                    }).catch(_e => {
                        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
                    });
                }
            }else  return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
        //}else  return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}



module.exports ={saveNewBill,getBillSearch,getBillMaster,getBillItems,getAccount,openAccount}