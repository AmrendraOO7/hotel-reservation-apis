const Console = require('Console');
const db = require('../../config/db.config');

class tableBookingMessage {

    static async getAllUnreadMessage(){
        var query = `SELECT bm.id, bm.time_from AS timeFrom, bm.time_upto AS timeUpto, bm.number_of_table AS noOfTables, bm.type_id AS typeId, (SELECT title FROM type WHERE id = bm.type_id) AS type, bm.category_id AS categoryId, (SELECT title FROM category WHERE id = bm.category_id) AS category, bm.no_of_adult_guest AS noOfAdultGuest, bm.no_of_child_guest AS noOfChildGuest, bm.name fullName, bm.email, bm.mobile, bm.address, bm.id_type AS identificationType, bm.id_number AS identificationNumber, bm.unique_msg_code AS uniqueMessageCode, bm.status, DATE_FORMAT(bm.arrival_date,'%Y-%m-%d') AS arrivalDate FROM table_booking_message bm WHERE bm.status = ?;`
        return await new Promise((resolve,reject)=>{
            db.query(query,[Boolean(0)],(err,res)=>{
                Console.debug(err,res,'getAllUnreadMessage')
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    static async saveNewMessage(messageData){
        var query = 'INSERT INTO table_booking_message (time_from,time_upto,number_of_table,type_id,category_id,no_of_adult_guest,no_of_child_guest,name,email,mobile,address,id_type,id_number,unique_msg_code,status,created_date,updated_date,arrival_date) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    messageData.timeFrom,
                    messageData.timeUpto,
                    messageData.noOfTables,
                    Number(messageData.typeId),
                    Number(messageData.categoryId),
                    Number(messageData.noOfAdultGuest),
                    Number(messageData.noOfChildGuest),
                    messageData.name,
                    messageData.email,
                    messageData.mobile,
                    messageData.address,
                    messageData.identificationType,
                    messageData.identificationNumber,
                    messageData.uniqueMessageCode,
                    Boolean(0),
                    new Date(),
                    null,
                    messageData.arrivalDate
                ],
                (err,res)=>{
                    Console.debug(err,res,'saveNewMessage')
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async updateMessage(messageData){
        var query = 'UPDATE table_booking_message SET time_from = ?, time_upto = ?, number_of_table = ?, type_id = ?, category_id = ?, no_of_adult_guest = ?, no_of_child_guest = ?, name = ?, email = ?, mobile = ?, address = ?, id_type = ?, id_number = ?, unique_msg_code = ? , updated_date = ?, arrival_date = ? WHERE id = ?';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    messageData.timeFrom,
                    messageData.timeUpto,
                    messageData.noOfTables,
                    Number(messageData.typeId),
                    Number(messageData.categoryId),
                    Number(messageData.noOfAdultGuest),
                    Number(messageData.noOfChildGuest),
                    messageData.fullName,
                    messageData.email,
                    messageData.mobile,
                    messageData.address,
                    messageData.idType,
                    messageData.idNumber,
                    messageData.uniqueMessageCode,
                    Boolean(0),
                    new Date(),
                    messageData.arrivalDate,
                    Number(messageData.id)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async updateMessageRead(id){
        var query = 'UPDATE table_booking_message SET status = ? , updated_date = ? WHERE id = ?';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Boolean(1),
                    new Date(),
                    Number(id)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async deleteMessage(id){
        var query = 'UPDATE table_booking_message SET  STATUS = ? , updated_date = ? WHERE id = ?;';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Boolean(0),
                    new Date(),
                    Number(id)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async searchMessageByMobile(mobileNo,fullName,email){
        var query = `SELECT bm.id, bm.time_from AS timeFrom, bm.time_upto AS timeUpto, bm.number_of_table AS noOfTables, bm.type_id AS typeId, (SELECT title FROM type WHERE id = bm.type_id) AS type, bm.category_id AS categoryId, (SELECT title FROM category WHERE id = bm.category_id) AS category, bm.no_of_adult_guest AS noOfAdultGuest, bm.no_of_child_guest AS noOfChildGuest, bm.name AS fullName, bm.email, bm.mobile, bm.address, bm.id_type AS identificationType, bm.id_number AS identificationNumber, bm.unique_msg_code AS uniqueMessageCode, bm.status, bm.arrival_date as arrivalDate FROM table_booking_message bm WHERE bm.status = ? AND bm.mobile LIKE ${mobileNo}`;
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Boolean(0),
                    mobileNo,
                    fullName,
                    email
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async countNewMessages(){
        var query = 'SELECT COUNT(bm.id) AS newMessage FROM table_booking_message bm WHERE bm.status = ?';
        return await new Promise((resolve,reject)=>{
            db.query(query,[Boolean(0)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }
}

module.exports = tableBookingMessage;