const helper = require ('../middleware/helper.js');
const string = require ('../middleware/strings.js');
const db = require('../../config/db.config');
//const { cancelled } = require('../controllers/booking.controller.js');

var dateComparisonQuery = "(book_from BETWEEN ? AND ?) AND (book_to BETWEEN ? AND ?) AND (? BETWEEN book_from AND book_to) AND (? BETWEEN book_from AND book_to)";

class Booking {

    static async allRoomAvailability(){
        var query = "SELECT r.id, r.title, r.price, r.category_id, (SELECT title FROM category WHERE id = r.category_id) AS category, r.type_id, (SELECT title FROM type WHERE id = r.type_id) AS type ,r.floor_id, (SELECT title FROM floor WHERE id = r.floor_id) AS floor FROM room r WHERE id NOT IN(SELECT room_id FROM booking WHERE booking_status <> 'checked_out' AND booking_status <> 'cancelled');";
        return await new Promise((resolve,reject)=>{
            db.query(query,[],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    static async getRoomTitle(id){
        var query = "SELECT title from room where id = ?";
        return await new Promise((resolve,reject)=>{
            db.query(query,[Number(id)],(err,res)=>{
                console.log(err,res[0]["title"]);
                if(err) reject(err);
                else resolve(res[0]["title"]);
            });
        });
    }

    // room status 
    static async allRoomStatus(){
        var query = "SELECT r.id,r.title, r.room_status_id AS roomStatusId, (SELECT rs.title FROM room_status rs WHERE rs.id = r.room_status_id) AS roomCurrentStatus, r.type_id, (SELECT title FROM type WHERE id = r.type_id) AS type, r.category_id,(SELECT title FROM category WHERE id = r.category_id) AS category, r.description,r.price,r.images,r.floor_id floorId, (SELECT title FROM floor WHERE id = r.floor_id) AS floor, r.created_date AS createdDate, r.updated_date AS updatedDate, r.status FROM room r;";
        return await new Promise((resolve,reject)=>{
            db.query(query,[],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //details for biling
    static async roomdetailsForBilling(id){
        var query = "SELECT id,book_from AS bookFrom, book_to AS bookTo, check_in AS checkIn, check_out AS checkOut, b.room_id AS roomId,(SELECT title FROM room WHERE id = b.room_id) AS roomName, booking_code  AS bookingCode, number_of_child AS numberOfChildGuest, number_of_adult AS numberOfAdultGuest, name,email,address,mobile,price,disc_pc AS discPc, disc_amt AS discAmt,total,vat_pc as vatPc,vat_amt as vatAmt, net_pay as netPay,service_charge as serviceCharge,service_charge_amount AS serviceChargeAmt, words, no_of_days_stayed AS noOfDaysStayed FROM booking b WHERE id = ?;";
        return await new Promise((resolve,reject)=>{
            db.query(query,[Number(id)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //request for booking
    static async requestBooking(book){
        var query = "INSERT INTO booking (user_id, book_from, book_to, booking_status, check_in, check_out, created_date, updated_date, status, room_id, booking_code,id_number,id_type,number_of_child,number_of_adult,name,email,address,mobile,categoryId,typeId,noOfRooms) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?); UPDATE room SET room_status_id = ? WHERE id IN (?);";
        const date = new Date();
        const checkIn = book.checkIn ? Boolean(Number(book.checkIn)) : false;
        return await new Promise((resolve,reject)=>{
            db.query(query ,
                [
                    book.userId, 
                    book.fromDate, 
                    book.toDate, 
                    book.bookingStatus ? book.bookingStatus.toLowerCase() : 'pending', 
                    //bellew code need to be implimented when checkin option is build from ui. currently builted but not being used properly
                    //checkIn == true ? date : null, // this value is assigned above and checked here..
                    checkIn == true ? date : date,
                    null, 
                    date, 
                    date, 
                    true, 
                    book.roomIdSelected, 
                    book.bookingCode,
                    book.identificationNumber,
                    book.identificationType,
                    book.noOfChildGuest,
                    book.noOfAdultGuest,
                    book.name,
                    book.email,
                    book.address,
                    book.mobile,
                    book.categoryId,
                    book.typeId,
                    book.noOfRooms,
                    //updating the status in room table
                    Number(3), //Occupied
                    book.roomId
                ],                    
                (err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }


    //update booking status and bill details
    static async updatedBookingStatus(bookingStatus, id,checkedOut,price,discPc,discAmt,total,vatPc,vatAmt,netPay,serviceCharge,serviceChargeAmt,noOfDaysStayed,costOfStaying,roomId,words){
        if(checkedOut && checkedOut == true) {
            if( price === null || discPc === null || discAmt === null || total  === null) return helper.apiCallBack(null, null, string.REQUIRED_FIELDS, string.INFO_CODE)
            var midQuery = `,check_out = NOW() ,status = false , price = ${price} , disc_pc = ${discPc} , disc_amt = ${discAmt} , total = ${total} ,vat_pc = ${vatPc}, vat_amt= ${vatAmt},net_pay= ${netPay} ,service_charge = ${serviceCharge},service_charge_amount=${serviceChargeAmt}, no_of_days_stayed = ${noOfDaysStayed}, cost_of_staying = ${costOfStaying}, words = '${words}' `;
            var roomStatusUpdateQueryOnCheckout = ` ;UPDATE room SET room_status_id = ${Number(2)} WHERE id = ${Number(roomId)};`;
        }
        else {
            var midQuery = "";
            var roomStatusUpdateQueryOnCheckout = "";
        }
        var query = `UPDATE booking set booking_status=?,updated_date = ? ${midQuery} WHERE id=? ${roomStatusUpdateQueryOnCheckout};`;
       
        return await new Promise((resolve,reject)=>{
            db.query(query, 
                [
                    bookingStatus.toLowerCase(),
                    new Date(),
                    Number(id)  
                ]
                ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

        //update booking status date and booking status
        static async updatedBookingStatusByFromdate(fromDate,toDate){
            var query = "UPDATE booking SET booking_status = ?, updated_date = ? WHERE (book_from BETWEEN ? AND ?) and booking_status = ?";
            return await new Promise((resolve,reject)=>{
                db.query(query , ['canceled',new Date(), fromDate,toDate, 'pending'] ,(err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
            });
        }

    //update all rooms booked by perticular user
    static async updatedAllBookingStatusBookedByMobile(bookingStatus, mobile){
        var query = "UPDATE booking SET booking_status=?,updated_date = ? WHERE user_id=? AND booking_status = ?";
        return await new Promise((resolve,reject)=>{
            db.query(query , [bookingStatus.toLowerCase(),new Date(), Number(mobile), 'pending'] ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //find by booking code
    static async findBookingByCode(bookingCode){
        var query = "SELECT id, user_id AS userId,booking_code AS bookingCode, book_from AS bookFrom,"; 
        query += "book_to AS bookTo, booking_status AS bookingStatus,check_in AS checkIn, check_out AS checkOut FROM booking WHERE booking_code=?";
        return await new Promise((resolve,reject)=>{
            db.query(query , [ Number(bookingCode) ] ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //validate if booking code is unique or not
    static async isBookingCodeAlreadyPresent(bookingCode){
        var query = "SELECT count(id) FROM booking WHERE booking_code=?";
        return await new Promise((resolve,reject)=>{
            db.query(query , [ Number(bookingCode) ] ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //check in
    static async roomCheckIn(about){
        //var query = `UPDATE booking SET check_in = NOW() WHERE mobile = ? AND booking_status = 'confirmed'`;
        var query = `UPDATE booking SET check_in = ? WHERE mobile = ? AND booking_status = 'confirmed'`;
        return await new Promise((resolve,reject)=>{
                db.query(query, 
                    [
                        new Date(),
                        about.mobile
                    ]  ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //checkout and bill data update
    static async roomCheckOut(mobile,checkedOut,price,discPc,discAmt,total,vatPc,vatAmt,netPay,serviceCharge,serviceChargeAmt,noOfDaysStayed,costOfStaying,roomId) {
        //var query = "UPDATE booking set check_out=? WHERE id=?";
        if(checkedOut && checkedOut == true) {
            if( price === null || discPc === null || discAmt === null || total  === null) return helper.apiCallBack(null, null, string.REQUIRED_FIELDS, string.INFO_CODE)
            var midQuery = ` , price = ${price} , disc_pc = ${discPc} , disc_amt = ${discAmt} , total = ${total} ,vat_pc = ${vatPc}, vat_amt= ${vatAmt},net_pay= ${netPay} ,service_charge = ${serviceCharge},service_charge_amount=${serviceChargeAmt}, no_of_days_stayed = ${noOfDaysStayed}, cost_of_staying = ${costOfStaying} `;
        }
        var query = `UPDATE booking SET check_out = CURDATE() , status = false ${midQuery} WHERE mobile = ? AND booking_status = ?; UPDATE room SET room_status_id = ? WHERE id = ?;`;
        return await new Promise((resolve,reject)=>{
            db.query(query, 
                [
                    // Number(price),
                    // Number(discPc),
                    // Number(discAmt),
                    // Number(total),
                    mobile,
                    'checked_in',
                    //to update room status in room table
                    Number(2),
                    Number(roomId)
                ] ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    
    //cancelled individual
    static async roomCancelled(id,roomId) {
        //var query = "UPDATE booking set check_out=? WHERE id=?";
        var query = 'UPDATE booking SET status = ? WHERE id = ?; UPDATE room SET room_status_id = ? WHERE id = ?;';
        return await new Promise((resolve,reject)=>{
            db.query(query, 
                [
                    Boolean(0),
                    Number(id),
                    //for update status in room table
                    Number(6), // room ready
                    Number(roomId)
                ] ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    static async searchRoomAvailability(fromDate, toDate,noOfRoom, typeId, categoryId) {
        const query = `SELECT COUNT(r.id) AS total FROM room r WHERE (r.id NOT IN 
        (SELECT room_id FROM booking WHERE check_out IS NULL AND `;
        query += dateComparisonQuery;    
        query += ` AND booking_status=?)) AND r.type_id=? AND r.category_id=? AND r.status=? limit ?`;
        return await new Promise((resolve,reject)=>{
            db.query(query,[fromDate, toDate, fromDate, toDate, fromDate, toDate,'confirmed', Number(typeId), Number(categoryId), true, noOfRoom],(err,res)=>{
                if(err) reject(err);
                else resolve(res[0]["total"]);
            });
        });
    }

    static async getRoomForBooking(date, noOfRoom, typeId, categoryId) {
        var limit = '';
        if(!noOfRoom || noOfRoom === undefined || noOfRoom === 0) limit = '';
        else limit = 'limit ?';
        const query = `SELECT id, title FROM room r WHERE (r.id NOT IN (SELECT room_id FROM booking WHERE check_out IS NULL AND ? BETWEEN DATE(book_from) AND DATE(book_to) AND booking_status=? OR booking_status = ? OR booking_status = ?)) AND r.type_id=? AND r.category_id=? AND r.status=? Order by r.title ${limit}`;
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    date,
                    'pending', //always in lower
                    'confirmed', //always in lower
                    'checked_in',
                    Number(typeId), 
                    Number(categoryId), 
                    true, 
                    Number(noOfRoom),
                ]
                ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //filter all available room for booking
    static async findAllRooms(fromDate, toDate, typeId, categoryId) {
        var query = `SELECT id FROM room r WHERE (r.id NOT IN (SELECT room_id FROM booking WHERE check_out IS NULL AND `;
        query += dateComparisonQuery;
        query += `AND booking_status=?)) AND r.type_id=? AND r.category_id=? AND r.status=? Order by r.title `;
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    fromDate, 
                    toDate, 
                    fromDate, 
                    toDate, 
                    fromDate, 
                    toDate, 
                    'confirmed', 
                    Number(typeId), 
                    Number(categoryId), 
                    true
                ],
                (err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //get all active rooms
    static async allRooms(limit,offset){
        var query = 'SELECT id,title,type_id as typeId,category_id as categoryId,description,price,images,floor_id as floorId,created_date createdDate,updated_date updatedDate,status FROM room WHERE status = ? ORDER BY id LIMIT ? OFFSET ? ';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Boolean(1),
                    Number(limit),
                    Number(offset)
                ],
                (err,res)=>{
                if(err) reject(err);
                else resolve(res);
            })
        });
    }


    //get all room by booking is and status
    static async getAllRoomByBookingId(mobile){
        var query = 'SELECT b.id, b.user_id AS userId, u.name AS customerName, book_from AS bookingFrom, book_to AS bookingUpto, booking_status AS bookingStatus, check_in AS checkIn ,check_out checkOut, b.STATUS, b.room_id AS roomId, r.title AS roomNumber, r.type_id AS typeId, t.title AS type, r.category_id AS categoryId, c.title AS category, r.description, r.price, r.floor_id AS floorId, f.title AS floorName ,booking_code AS bookingCode,  b.id_number AS identificationNumber, b.id_type AS identificationType, b.number_of_child AS noOfChildGuest, b.number_of_adult AS noOfAdultGuest, b.name , b.email, b.address, b.mobile, b.categoryId, b.typeId, b.noOfRooms  FROM booking b\n'
        query += 'LEFT JOIN user u ON b.user_id = u.id\n';
        query += 'LEFT JOIN room r ON b.room_id = r.id\n';
        query += 'LEFT JOIN type t ON r.type_id = t.id\n';
        query += 'LEFT JOIN category c ON r.category_id = c.id\n';
        query += 'LEFT JOIN floor f ON r.floor_id = f.id\n';
        query += "WHERE b.mobile = ? AND (booking_status = ? OR booking_status = ? OR booking_status = ?)"
        //query += 'WHERE b.mobile = (SELECT mobile FROM booking WHERE booking_code LIKE "%?%" ) AND (booking_status = ? OR booking_status = ? OR booking_status = ?)'
        //query += 'WHERE user_id = (SELECT user_id FROM booking WHERE booking_code LIKE "%?%" ) AND (booking_status = ? OR booking_status = ? OR booking_status = ?)'
        //query += 'WHERE user_id = (SELECT user_id FROM booking WHERE booking_code LIKE "%?%" ) AND booking_status = ? OR user_id = (SELECT user_id FROM booking WHERE booking_code LIKE "%?%" ) AND booking_status =  ? OR user_id = (SELECT user_id FROM booking WHERE booking_code LIKE "%?%" ) AND booking_status = ?'
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    mobile,
                    'pending',
                    'confirmed',
                    'checked_in'
                ],(err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    //get all room by booking is and status
    static async getAllActiveBooking(status,date){
        //var newdate = date.toISOString().substr(0,10);
        var query = `SELECT b.id, b.user_id AS userId,(SELECT u.name FROM user u WHERE u.id = b.user_id) AS customerName, DATE_FORMAT(b.book_from,'%Y-%m-%d') AS bookingFrom, DATE_FORMAT(b.book_to,'%Y-%m-%d') AS bookingUpto, booking_status AS bookingStatus, DATE_FORMAT(b.check_in,'%Y-%m-%d') AS checkIn ,DATE_FORMAT(b.check_out,'%Y-%m-%d') AS checkOut, b.status, b.room_id AS roomId, (SELECT r.title FROM room r WHERE r.id = b.room_id) AS roomNumber, r.description, r.price, r.floor_id AS floorId, f.title AS floorName ,booking_code AS bookingCode,  b.id_number AS identificationNumber, b.id_type AS identificationType, b.number_of_child AS noOfChildGuest, b.number_of_adult AS noOfAdultGuest, b.name as fullName, b.email, b.address, b.mobile, b.categoryId, (SELECT c.title FROM category c WHERE c.id = b.categoryId) AS category, b.typeId, (SELECT t.title FROM type t WHERE t.id = b.typeId) AS type, b.noOfRooms FROM booking b\n`
         query += 'LEFT JOIN room r ON b.room_id = r.id\n';
        query += 'LEFT JOIN floor f ON r.floor_id = f.id\n';
        if(status != 'all') query +=  `WHERE b.booking_status = '${status}' AND check_in like '%${date}%' ORDER BY b.id DESC`;
        else query +=`ORDER BY b.id DESC`;
        //else query +=`WHERE book_from = '${date}' ORDER BY b.id DESC`;
        //query += 'WHERE b.mobile = (SELECT mobile FROM booking WHERE booking_code LIKE "%?%" ) AND (booking_status = ? OR booking_status = ? OR booking_status = ?)'
        //query += 'WHERE user_id = (SELECT user_id FROM booking WHERE booking_code LIKE "%?%" ) AND (booking_status = ? OR booking_status = ? OR booking_status = ?)'
        //query += 'WHERE user_id = (SELECT user_id FROM booking WHERE booking_code LIKE "%?%" ) AND booking_status = ? OR user_id = (SELECT user_id FROM booking WHERE booking_code LIKE "%?%" ) AND booking_status =  ? OR user_id = (SELECT user_id FROM booking WHERE booking_code LIKE "%?%" ) AND booking_status = ?'
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                ],(err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    //get user booking history
    static async getUserHistory(mobile,type){
        var query = 'SELECT b.id, b.user_id AS userId, u.name AS customerName, book_from AS bookingFrom, book_to AS bookingUpto, booking_status AS bookingStatus, check_in AS checkIn ,check_out checkOut, b.STATUS, b.room_id AS roomId, r.title AS roomNumber, r.type_id AS typeId, t.title AS type, r.category_id AS categoryId, c.title AS category, r.description, r.price, r.floor_id AS floorId, f.title AS floorName ,booking_code AS bookingCode FROM booking b\n'
        query += 'LEFT JOIN user u ON b.user_id = u.id\n';
        query += 'LEFT JOIN room r ON b.room_id = r.id\n';
        query += 'LEFT JOIN type t ON r.type_id = t.id\n';
        query += 'LEFT JOIN category c ON r.category_id = c.id\n';
        query += 'LEFT JOIN floor f ON r.floor_id = f.id\n';
        if(type === 'activeOnly') query += 'WHERE (mobile = ? AND booking_status = ?) || (mobile = ? AND booking_status = ?) || (mobile = ? AND booking_status = ?);'
        else query += 'WHERE mobile = ?\n';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Number(mobile),
                    'pending',
                    Number(mobile),
                    'confirmed',
                    Number(mobile),
                    'checked_in'
                ],
                (err,res)=>{
                if(err) reject(err);
                else resolve(res);
            })
        });
    }

    //update all staues for perticulat user by user id
    static async updateAllRoomStatusByMobile(updateData){
        var query = "UPDATE booking SET booking_status = ?, updated_date = ? WHERE mobile = ? AND booking_status = ? and id = ?;";
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    updateData.toUpdateStatus,
                    new Date(),
                    updateData.mobile,
                    updateData.currentStatus,
                    updateData.id
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

}

module.exports = Booking;
