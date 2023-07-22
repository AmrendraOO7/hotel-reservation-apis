const Console = require('Console');
const db = require('../../config/db.config');

class bookingMessage {

    static async getAllUnreadMessage(){
        //DATE_FORMAT(bm.from_date,'%Y-%m-%d') AS fromDate, DATE_FORMAT(bm.to_Date,'%Y-%m-%d') AS toDate
        var query = `SELECT bm.id, DATE_FORMAT(bm.from_date,'%Y-%m-%d') AS fromDate, DATE_FORMAT(bm.to_Date,'%Y-%m-%d') AS toDate, bm.number_of_rooms AS noOfRooms, bm.type_id AS typeId, (SELECT title FROM type WHERE id = bm.type_id) AS type, bm.category_id AS categoryId, (SELECT title FROM category WHERE id = bm.category_id) AS category, bm.no_of_adult_guest AS noOfAdultGuest, bm.no_of_child_guest AS noOfChildGuest, bm.full_name fullName, bm.email, bm.mobile, bm.address, bm.id_type AS identificationType, bm.id_number AS identificationNumber, bm.unique_msg_code AS uniqueMessageCode, bm.status FROM booking_message bm where bm.status = ?;`
        return await new Promise((resolve,reject)=>{
            db.query(query,[Boolean(0)],(err,res)=>{
                Console.debug(err,res,'getAllUnreadMessage')
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    static async saveNewMessage(messageData){
        var query = 'INSERT INTO booking_message (from_date,to_Date,number_of_rooms,type_id,category_id,no_of_adult_guest,no_of_child_guest,full_name,email,mobile,address,id_type,id_number,unique_msg_code,STATUS,created_date,updated_date,delete_status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    messageData.fromDate,
                    messageData.toDate,
                    messageData.noOfRooms,
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
                    Boolean(0)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async updateMessage(messageData){
        var query = 'UPDATE booking_message SET from_date = ?, to_Date = ?, number_of_rooms = ?, type_id = ?, category_id = ?, no_of_adult_guest = ?, no_of_child_guest = ?, full_name = ?, email = ?, mobile = ?, address = ?, id_type = ?, id_number = ?, unique_msg_code = ? , updated_date = ? WHERE id = ?';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    messageData.fromDate,
                    messageData.toDate,
                    messageData.noOfRooms,
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
                    Number(messageData.id)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async updateMessageRead(id){
        var query = 'UPDATE booking_message SET status = ?  , updated_date = ? WHERE id = ?';
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
        var query = 'UPDATE booking_message SET  STATUS = ?, delete_status =? , updated_date = ? WHERE id = ?;';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Boolean(0),
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

    static async searchMessageByMobile(mobileNo,fullName,email){
        //DATE_FORMAT(bm.from_date,'%Y-%m-%d') AS fromDate, DATE_FORMAT(bm.to_Date,'%Y-%m-%d') AS toDate
        var query = `SELECT bm.id, DATE_FORMAT(bm.from_date,'%Y-%m-%d') AS fromDate,  DATE_FORMAT(bm.to_Date,'%Y-%m-%d') AS toDate, bm.number_of_rooms AS noOfRooms, bm.type_id AS typeId, (SELECT title FROM type WHERE id = bm.type_id) AS type, bm.category_id AS categoryId, (SELECT title FROM category WHERE id = bm.category_id) AS category, bm.no_of_adult_guest AS noOfAdultGuest, bm.no_of_child_guest AS noOfChildGuest, bm.full_name AS fullName, bm.email, bm.mobile, bm.address, bm.id_type AS identificationType, bm.id_number AS identificationNumber, bm.unique_msg_code AS uniqueMessageCode, bm.status FROM booking_message bm WHERE bm.status = ? AND bm.mobile LIKE ${mobileNo}`;
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
        var query = 'SELECT COUNT(bm.id) AS newMessage FROM booking_message bm WHERE bm.status = ?';
        return await new Promise((resolve,reject)=>{
            db.query(query,[Boolean(0)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }
}

module.exports = bookingMessage;