const bookingModel = require('../models/booking.model');
const helper = require ('../middleware/helper.js');
const string = require ('../middleware/strings.js');
const mail = require('../middleware/send.mail')
const dotenv = require('dotenv');
dotenv.config();


//all available rooms
async function availableRooms(req,res){
    bookingModel.allRoomAvailability().then(result =>{
        if(result && result.length>0){
            return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
        }else  return helper.apiCallBack(res,null,'No rooms available', string.INFO_CODE);
    })
}

async function roomsStatus(req,res){
    bookingModel.allRoomStatus().then(result =>{
        if(result && result.length>0){
            return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
        }else  return helper.apiCallBack(res,null,'No rooms available', string.INFO_CODE);
    })
}

//get booking details by mobile
async function roomDetails(req,res){
    var id = req.query['id'];
    if(id === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    bookingModel.roomdetailsForBilling(id).then(result =>{
        if(result && result.length>0){
            return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
        }else  return helper.apiCallBack(res,null,'No rooms available', string.INFO_CODE);
    })
}

//request for booking
async function requestForBooking(req,res){
    var bookingOrder = req.body;
    //var numberOfRooms = bookingOrder["noOfRooms"];
    var roomsList = bookingOrder['roomId']
    if(bookingOrder === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    //check individual required field
    if(bookingOrder.mobile === null || !bookingOrder.fromDate || !bookingOrder.toDate)
        return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);

    //get available room for booking
    await bookingModel.getRoomForBooking(bookingOrder.fromDate, bookingOrder.noOfRooms,bookingOrder.typeId, bookingOrder.categoryId).then( async(rooms) => {
        if(rooms.length > 0){
            var roomCount = rooms.length;
            if(Number(roomsList.length) <= roomCount){
                var bookingCodes = [];
                for(var i=0; i < roomsList.length; i++){
                    //generating 6 digit booking code
                    var bookinCode;
                    var id = roomsList[i];
                    var title = await bookingModel.getRoomTitle(id);
                    //var title = rooms[i]["title"];
                    bookingOrder['roomIdSelected'] =  id; 
                    //validate booking code already present or not           
                    do{
                        bookinCode = Math.floor(100000 + Math.random() * 900000);
                    }while(!await bookingModel.isBookingCodeAlreadyPresent(bookinCode));

                    bookingOrder['bookingCode'] = bookinCode; 
                    //save

                    var isSaved = await bookingModel.requestBooking(bookingOrder);
                    console.log(isSaved,'isSaved');
                    if(isSaved) bookingCodes.push({'roomId': id ,'title': title, 'bookingCode': bookinCode })


                    // await bookingModel.requestBooking(bookingOrder).then(async() => {
                    //     bookingCodes.push({'roomId': id ,'title': title, 'bookingCode': bookinCode })
                    // }).catch(_e => {
                    //     return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
                    // });
                }
                //toMail,fullName,userEmail,mobile,arrivalDate,departureDate,numberOfRooms,roomCategory,roomType,numberOfAdults,NumberOfChildrens
                //await mail.requestBookingMail();
                return helper.apiCallBack(res, bookingCodes, string.SUCCESS_MESSAGE.save, string.SUCCESS_CODE)
            } else return helper.apiCallBack(res,null,'You are trying to book more rooms then available!', string.INFO_CODE);
        } else return helper.apiCallBack(res,null,'Selected category rooms not available', string.INFO_CODE);
          
    }).catch(e => {
        console.log(e,e.message,'error')
    })     
}

//update booking status individually
async function updateBookingStatus(req,res) {
    console.log('indivisual status update at a line 84')
    var data = req.body;
    if(data === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    const id = data.id;
    const status = data.bookingStatus;
    //check individual required field
    if(id === null || ! status)
        return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    
    //update booking status
    //console.log(status, id, data.checkedOut, data.price, data.discPc, data.discAmt, data.total,data.vatPc,data.vatAmt,data.netPay,data.serviceCharge,data.noOfDaysStayed,data.costOfStaying,data.roomId,data.words);
    await bookingModel.updatedBookingStatus(status, id, data.checkedOut, data.price, data.discPc, data.discAmt, data.total, data.vatPc, data.vatAmt, data.netPay, data.serviceCharge,data.serviceChargeAmt, data.noOfDaysStayed, data.costOfStaying, data.roomId,data.words).then(async () => {
        return helper.apiCallBack(res, null, string.SUCCESS_MESSAGE.update, string.SUCCESS_CODE)
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}  

//update booking status
async function updateBookingStatusFromdate(req,res) {
    var data = req.body;
    if(data === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    const fromDate = data["fromDate"];
    const toDate = data["toDate"];
    //const status = data.bookingStatus;
    //check individual required field
    if(fromDate === null || toDate === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    
    //update booking status
    await bookingModel.updatedBookingStatusByFromdate(fromDate,toDate).then(async () => {
        return helper.apiCallBack(res, null, string.SUCCESS_MESSAGE.update, string.SUCCESS_CODE)
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}

async function updateBookingStatusByMobile(req,res) {
    var data = req.body;
    if(data === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    const mobile = data.mobile;
    const status = data.bookingStatus;
    //check individual required field
    if(id === null || ! status)
        return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    
    //update booking status
    await bookingModel.updatedAllBookingStatusBookedByMobile(status, mobile).then(async () => {
        return helper.apiCallBack(res, null, string.SUCCESS_MESSAGE.update, string.SUCCESS_CODE)
    }).catch(_e => {
        return helper.apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    })
}

//find by booking code
async function findByBookingCode(req, res) {
    var bookingCode = req.query['bookingCode'];
    if(!bookingCode) return helper.apiCallBack(res, null, "Required booking code to find data.", string.INFO_CODE)
    await bookingModel.findBookingByCode(bookingCode).then( result => {
        return helper.apiCallBack(res, result, null , string.SUCCESS_CODE)
    }).catch(_e => {
        return helper.apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    })
}

//check in
async function checkIn(req, res) {
    var data = req.body;
    console.log(data,'line 152');
    if(data === null) return helper.apiCallBack(null, null, string.REQUIRED_FIELDS, string.INFO_CODE);    
    //check all required field have value or not
    if(data.id === null && data.mobile === null)
        return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    await bookingModel.roomCheckIn(data).then( () => {
        return helper.apiCallBack(res, null, null , string.SUCCESS_CODE)
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}

//check out all	..  // THIS IS TEMPERORY NOT IN USE
async function checkOut(req, res) {
    var mobile = req.query['mobile'];
    var price = req.query['price'];
    var discPc = req.query['discPc'];
    var discAmt = req.query['discAmt'];
    var total = req.query['total'];
    var vatPc = req.query['vatPc']; 
    var vatAmt = req.query['vatAmt'];
    var netPay = req.query['netPay'];
    var serviceCharge = req.query['serviceCharge'];
    var roomId = req.query['roomId'];
    //if(mobile === null || price === null || discPc === null || discAmt === null || total  === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE)
    if(mobile === null) return helper.apiCallBack(null, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    await bookingModel.roomCheckOut(mobile,price,discPc,discAmt,total,vatPc,vatAmt,netPay,serviceCharge,roomId).then( () => {
                return helper.apiCallBack(res, null, null , string.SUCCESS_CODE)
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}

//cancelled
async function cancelled(req, res) {
    //var mobile = req.query['mobile'];
    var id = req.query['id'];
    var roomId = req.query['roomId'];
    if((!id && id === null) || (!roomId && roomId === null)) return helper.apiCallBack(null, null, string.REQUIRED_FIELDS, string.INFO_CODE)
    await bookingModel.roomCancelled(id,roomId).then( () => {
        return helper.apiCallBack(res, null, null , string.SUCCESS_CODE)
    }).catch(_e => {
        return helper.apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    })
}

//search available room
async function searchForRoomAvailability(req,res){
    var fromDate = req.query['fromDate'];
    var toDate = req.query['toDate'];
    var noOfRooms = req.query['noOfRooms'];
    var typeId = req.query['typeId'];
    var categoryId = req.query['categoryId'];
    if(date === null || noOfRooms === null || typeId === null || categoryId === null) return apiCallBack(res,null,'Sorry but Id not found to featch data.',INFO_CODE);
    await bookingModel.searchRoomAvailability(fromDate, toDate, noOfRooms, typeId, categoryId).then(result=>{
        return apiCallBack(res,result,null,SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    });
}

//find all available room
async function findAllAvailableRooms(req,res){
    var fromDate = req.query['fromDate'];
    var toDate = req.query['toDate'];
    var typeId = req.query['typeId'];
    var categoryId = req.query['categoryId'];
    if(toDate === null || fromDate === null || typeId === null || categoryId === null) return apiCallBack(res,null,'Sorry but Id not found to featch data.',string.INFO_CODE);
    await bookingModel.findAllRooms(fromDate, toDate, typeId, categoryId).then(result=>{
        return apiCallBack(res,result,null,string.SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });   
}

    //find all room
async function getAllRooms(req,res){
    var limit = req.query["limit"];
    var offset = req.query["offset"];
   if(!limit|| !offset) return helper.apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    await bookingModel.allRooms(limit,offset).then(result=>{
        if(result.length > 0) return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
        else return helper.apiCallBack(res,null,"No rooms found..!",string.INFO_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
};

//get all room by booking code
async function getAllRoomByBookingCode(req,res){
    var mobile = req.query['mobile'];

    if(!mobile && !mobile) return helper.apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    await bookingModel.getAllRoomByBookingId(mobile).then(result =>{
        if(result.length>0){
            return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
        }else return helper.apiCallBack(res,null,"No rooms found..!",string.INFO_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,"No rooms found..!", string.ERROR_500.code);
    });
}


//get all room by booking code
async function getAllRoomByStatus(req,res){
    var status = req.query['status'];
    var date = req.query['date']
    if(!status && !date) return helper.apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    await bookingModel.getAllActiveBooking(status,date).then(result =>{
        return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,"No rooms found..!", string.ERROR_500.code);
    });
}

//get all user history by mobile
async function getAllUserHistoryByMobile(req,res){
    var mobile = req.query['mobile'];
    var type = req.query['type'];
    if(!mobile && !mobile) return helper.apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    await bookingModel.getUserHistory(mobile,type).then(result =>{
        if(result.length>0){
            return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
        }else return helper.apiCallBack(res,null,"No History found..!",string.INFO_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,"No History found..!", string.ERROR_500.code);
    });
}

//update room by booking code and status
async function updateBookingcodeByMobile(req,res){
    var updateData = req.body;
    if(!updateData || updateData === null) return helper.apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    if(!updateData["toUpdateStatus"] || !updateData["mobile"], !updateData["currentStatus"])   return helper.apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    await bookingModel.getAllRoomByBookingId(updateData["mobile"]).then(async result =>{
        if(result.length>0){
            for(var i=0;i<result.length;i++){
                //console.log('id:',result[i]['id']);
                var id = result[i]['id']
                updateData['id'] = id;
                await bookingModel.updateAllRoomStatusByMobile(updateData).then(()=>{
                    
                }).catch(_e => {
                    return apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
                });
            }
            return helper.apiCallBack(res,null,string.SUCCESS_MESSAGE.update,string.SUCCESS_CODE);
            //return helper.apiCallBack(res,null,null,string.SUCCESS_CODE);
        }else return helper.apiCallBack(res,null,"No rooms found..!",string.INFO_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,"No rooms found..!", string.ERROR_500.code);
    });



   
}

//get avaliable rooms
async function getAvailableRooms(req,res){
    var bookingOrder = req.query;
    if(bookingOrder === null) return helper.apiCallBack(res, null, string.REQUIRED_FIELDS, string.INFO_CODE);
    await bookingModel.getRoomForBooking(bookingOrder.fromDate, bookingOrder.noOfRooms,bookingOrder.typeId, bookingOrder.categoryId).then(result =>{
        if(result.length>0)
        {
            var roomAvailable = result.length;
            if(bookingOrder.noOfRooms){
                if(roomAvailable >= bookingOrder.noOfRooms){
                    return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
                }else return helper.apiCallBack(res,null,'Sorry!, You request is more than availability.',string.SUCCESS_CODE);
            }
            else{
                if(roomAvailable > 0) return helper.apiCallBack(res,result,null,string.SUCCESS_CODE);
                else return helper.apiCallBack(res,null,'Sorry!, This category rooms ate not available.',string.SUCCESS_CODE);
            }
            
        }
        else return helper.apiCallBack(res,null,'No Rooms found',string.SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,string.ERROR_500.message, string.ERROR_500.code);
    });
}


module.exports = {availableRooms, roomsStatus, roomDetails, requestForBooking, updateBookingStatus, findByBookingCode, checkIn, checkOut,cancelled, searchForRoomAvailability, updateBookingStatusFromdate, findAllAvailableRooms, getAllRooms,updateBookingStatusByMobile,getAllRoomByBookingCode,updateBookingcodeByMobile, getAllUserHistoryByMobile,getAvailableRooms,getAllRoomByStatus}