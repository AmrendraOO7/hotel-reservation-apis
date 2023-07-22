const db = require('../../config/db.config');

// var dateComparisonQuery = "(book_from BETWEEN ? AND ?) AND (book_to BETWEEN ? AND ?) AND (? BETWEEN book_from AND book_to) AND (? BETWEEN book_from AND book_to)";

class tableBooking {

     //request for table booking
    static async requestTableBooking(book){
        var query = "INSERT INTO table_booking (table_id,user_id,booking_status,estimated_time,created_date,updated_date,arrival_date,category_id,type_id,number_of_tables,number_of_child,number_of_adult,name,email,address,mobile,id_type,id_number,status,time_from,time_upto,booking_code) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        const date = new Date();
        //const checkIn = book.checkIn ? Boolean(Number(book.checkIn)) : false;
        return await new Promise((resolve,reject)=>{
            db.query(query ,
                [
                    book.tableId, 
                    book.userId, 
                    book.bookingStatus ? book.bookingStatus.toLowerCase() : 'pending',
                    book.estimatedTime ? book.estimatedTime : null,
                    //checkIn == true ? date : null, // this value is assigned above and achecked here.. 
                    date, 
                    date, 
                    book.arrivalDate,
                    Number(book.categoryId) ? Number(book.categoryId) : null,
                    Number(book.typeId),
                    Number(book.noOfTables),
                    Number(book.noOfChildGuest),
                    Number(book.noOfAdultGuest),
                    book.name,
                    book.email,
                    book.address,
                    book.mobile,
                    book.identificationNumber,
                    book.identificationType,
                    Boolean(1),
                    book.timeFrom,
                    book.timeUpto,
                    book.bookingCode
                ],                    
                (err,res)=>{
                    console.log(res,err,'requestTableBooking')
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    static async allBookingList(date){
        var query = `SELECT tb.id, tb.table_id AS tableId, (SELECT rt.title FROM resturant_table rt WHERE rt.id = tb.table_id) AS tableName, tb.user_id AS userId, tb.booking_status AS bookingStatus, tb.estimated_time AS estimatedTime, tb.created_date AS createdDate, tb.updated_date AS updatedDate,  DATE_FORMAT(tb.arrival_date,'%Y-%m-%d') AS arrivalDate, tb.category_id AS categoryId, (SELECT title FROM category WHERE id = tb.category_id) AS category, tb.type_id AS typeId, (SELECT title FROM type WHERE id = tb.type_id) AS type, tb.number_of_tables AS noOfTables, tb.number_of_child AS noOfChildGuest, tb.number_of_adult AS noOfAdultGuest, tb.name AS fullName, tb.email, tb.address, tb.mobile, tb.id_type AS identificationType, tb.id_number AS identificationNumber, tb.status, tb.time_from AS timeFrom, tb.time_upto AS timeUpto, tb.booking_code AS bookingCode FROM table_booking tb WHERE arrival_date = ? ORDER BY id DESC;`;
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    date
                ],
                (err,res)=>{ console.log(res,err,'requestTableBooking')
                if(err) reject(err);
                else resolve(res);
            });
        });
    }


    static async getTableForBooking(date, noOfTable, typeId, time) {
        var limit = '';
        if(!noOfTable || noOfTable === undefined || noOfTable === 0) limit = '';
        else limit = 'limit ?';
        const query = `SELECT rt.id, rt.title FROM resturant_table rt WHERE id NOT IN (SELECT tb.table_id FROM table_booking tb WHERE tb.arrival_date = ? AND ? NOT BETWEEN TIME(tb.time_from) AND TIME(tb.time_upto) AND tb.booking_status = ? OR tb.booking_status = ? OR tb.booking_status = ?) AND rt.type_id=? AND rt.status = ? ORDER BY rt.id ${limit}`;
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    date,
                    time,
                    'pending', //always in lower
                    'confirmed', //always in lower
                    'checked_in',
                    Number(typeId), 
                    true, 
                    Number(noOfTable)
                ]
                ,(err,res)=>{
                    console.log(err,res);
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    static async isBookingCodeAlreadyPresent(bookingCode){
        var query = "SELECT count(id) FROM table_booking WHERE booking_code=?";
        return await new Promise((resolve,reject)=>{
            db.query(query , [ Number(bookingCode) ] ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    
    //check in
    static async tableCheckIn(updateData){
        var query = "UPDATE table_booking SET booking_status = ?, arrival_date = NOW() WHERE booking_status = 'confirmed' AND id = ?; SELECT tb.id, tb.table_id AS tableId, tb.user_id AS userId, tb.booking_status AS bookingStatus, tb.estimated_time AS estimatedTime, tb.created_date AS createdDate, tb.updated_date AS updatedDate, tb.arrival_date AS arrivalDate, tb.category_id AS categoryId, (SELECT title FROM category WHERE id = tb.category_id) AS category, tb.type_id AS typeId, (SELECT title FROM type WHERE id = tb.type_id) AS type, tb.number_of_tables AS noOfTables, tb.number_of_child AS noOfChildGuest, tb.number_of_adult AS noOfAdultGuest, tb.name AS fullName, tb.email, tb.address, tb.mobile, tb.id_type AS identificationType, tb.id_number AS identificationNumber, tb.status, tb.time_from AS timeFrom, tb.time_upto AS timeUpto, tb.booking_code AS bookingCode FROM table_booking tb where tb.id = ?";
        return await new Promise((resolve,reject)=>{
            // db.query(query, [dataSets] ,(err,res)=>{
                db.query(query, 
                    [
                        updateData.bookingStatus,
                        Number(updateData.id),
                        Number(updateData.id)
                    ]
                    ,(err,res)=>{
                if(err) reject(err);
                else resolve(res[1][0]);
            });
        });
    
    }

     //checkout
    static async tableCheckOut(updateData) {
        var query = "UPDATE table_booking SET booking_status = ?, check_out_date = NOW(), status = ? WHERE booking_status = 'checked_in' AND id = ?";
        return await new Promise((resolve,reject)=>{
            db.query(query, 
                [
                    updateData.bookingStatus,
                    Boolean(0),
                    Number(updateData.id)
                ] ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //cancelled
    static async tableCancelled(updateData) {
        var query = "UPDATE table_booking SET booking_status = ?, check_out_date = '0001-01-01', status = ? WHERE booking_status = 'confirmed' AND id = ?";
        return await new Promise((resolve,reject)=>{
            db.query(query, 
                [
                    updateData.bookingStatus,
                    Boolean(0),
                    Number(updateData.id)
                ] ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    static async getTableTitle(id){
        var query = "SELECT title from resturant_table where id = ?";
        return await new Promise((resolve,reject)=>{
            db.query(query,[Number(id)],(err,res)=>{
                console.log(err,res[0]["resturant_table title"]);
                if(err) reject(err);
                else resolve(res[0]["title"]);
            });
        });
    }

}

module.exports = tableBooking;
