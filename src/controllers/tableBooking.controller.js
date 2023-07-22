const tableBookingModel = require('../models/tableBooking.model');
const tableBillingModel = require('../models/tableBilling.model');
const helper = require ('../middleware/helper.js');
const string = require ('../middleware/strings.js');
const mail = require('../middleware/send.mail')
const dotenv = require('dotenv');
dotenv.config();

//request for booking
async function requestForTableBooking(req,res){ 
    var bookingOrder = req.body;
    // var numberOfTables = bookingOrder["noOfTables"];
    var tableList  = bookingOrder["tableId"];
    if(bookingOrder === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    //check individual required field
    if(bookingOrder.mobile === null || !bookingOrder.timeFrom || !bookingOrder.timeUpto) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);

    //get available room for booking //date, noOfTable, typeId, time
    //console.log(bookingOrder.arrivalDate, bookingOrder.noOfTable,bookingOrder.typeId, bookingOrder.time);
    await tableBookingModel.getTableForBooking(bookingOrder.arrivalDate, bookingOrder.noOfTables,bookingOrder.typeId, bookingOrder.timeFrom).then( async(tables) => {
        if(tables.length > 0){
            var tableCount = tables.length;
            if(Number(tableList.length) <= tableCount){
                var bookingCodes = [];
                for(var i=0; i < tableList.length; i++){
                    //generating 6 digit booking code
                    var bookinCode;
                    var id = tableList[i];
                    var title = await tableBookingModel.getTableTitle(id);
                    //var title = tables[i]["title"];

                    bookingOrder['tableId'] =  id;
                    //validate booking code already present or not            
                    do{
                        bookinCode = Math.floor(100000 + Math.random() * 900000);
                    }while(!await tableBookingModel.isBookingCodeAlreadyPresent(bookinCode));

                    bookingOrder['bookingCode'] = bookinCode; 
                    //save

                    var isSaved = await tableBookingModel.requestTableBooking(bookingOrder);
                    console.log(isSaved,'isSaved');
                    if(isSaved) bookingCodes.push({'tableId': id ,'title': title, 'bookingCode': bookinCode })

                    // await tableBookingModel.requestTableBooking(bookingOrder).then(async() => {
                    //     bookingCodes.push({'tableId': id ,'title': title, 'bookingCode': bookinCode })
                    // }).catch(_e => {
                    //     return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
                    // });
                }
                return helper.apiCallBack(res, bookingCodes, string.SUCCESS_MESSAGE.save, string.SUCCESS_CODE)
            } else return helper.apiCallBack(res,null,'You are trying to book more tables then available!', string.INFO_CODE);
        } else return helper.apiCallBack(res,null,'Selected category tables not available', string.INFO_CODE);
          
    }).catch(e => {
        console.log(e,'line 66')
    })     
}

async function getAllBookingList(req,res){
    var date = req.query.date;
    await tableBookingModel.allBookingList(date).then(result=>{
            if(result.length>0){
                return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
            }else return helper.apiCallBack(res,null,null, string.INFO_CODE);
        }).catch(_e => {
            return apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
        });
}

async function getAvailableTables(req,res){
    var bookingOrder = req.query;
    if(bookingOrder === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    await tableBookingModel.getTableForBooking(bookingOrder.arrivalDate, bookingOrder.noOfTables, bookingOrder.typeId, bookingOrder.time).then(result =>{
        if(result.length>0)
        {
            var tableAvailable = result.length;
            if(bookingOrder.noOfTables){
                if(tableAvailable >= bookingOrder.noOfTables){
                    return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
                }else return helper.apiCallBack(res,null,'Sorry!, You request is more than availability.',string.SUCCESS_CODE);
            }
            else{
                if(tableAvailable > 0) return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
                else return helper.apiCallBack(res,null,'Sorry!, You request is more than availability.',string.SUCCESS_CODE);
            }


        }else return helper.apiCallBack(res,null,'No tables found',string.SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

//check in table and opeaning account
async function checkInTable(req, res) {
    var data = req.body;
    if(data === null) return helper.apiCallBack(null, null, string.REQUIRED_FIELDS, string.INFO_CODE);    
    //check all required field have value or not
    if(data.id === null && data.mobile === null)
        return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    await tableBookingModel.tableCheckIn(data).then( async tableData => {
        if(tableData.tableId>0){
            await tableBillingModel.tableAccountOpen(tableData).then(()=>{
                return helper.apiCallBack(res, null, null , string.SUCCESS_CODE)
            }).catch(_e => {
                return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
            });
        }else return helper.apiCallBack(res,null,'Table Id missing.', ERROR_500.code);
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

async function tableCheckOut(req, res) {
     var checkOutData = req.body;
    if(!checkOutData === null) return helper.apiCallBack(null, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    await tableBookingModel.tableCheckOut(checkOutData).then( () => {
                return helper.apiCallBack(res, null, 'Table is checked out now.' , string.SUCCESS_CODE)
    }).catch(_e => {
        return helper.apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    })

}

async function cancelled(req, res) {
    var cancelData = req.body;
   if(!cancelData === null) return helper.apiCallBack(null, null, string.REQUIRED_FIELDS, string.INFO_CODE);
   await tableBookingModel.tableCancelled(cancelData).then( () => {
               return helper.apiCallBack(res, null, 'Table is cancelled now.' , string.SUCCESS_CODE)
   }).catch(_e => {
       return helper.apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
   })

}
module.exports = { requestForTableBooking,getAllBookingList,getAvailableTables,checkInTable,tableCheckOut,cancelled}