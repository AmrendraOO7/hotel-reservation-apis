const db = require('../../config/db.config');

class ContactMessage{
    static async saveNewMessage(messageData){
        var query = 'INSERT INTO contact_us (full_name,contact,message,created_date,updated_date,status,read_status) VALUES(?,?,?,?,?,?,?);';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    messageData.fullName,
                    messageData.contact,
                    messageData.message,
                    new Date(),
                    null,
                    Boolean(1),
                    Boolean(0)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async updateMessageRead(id){
        var query = 'UPDATE contact_us set updated_date = ?, read_status = ? , status = ? where id = ?;';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    new Date(),
                    Boolean(1),
                    Boolean(0),
                    Number(id)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async updateMessageDelete(id){
        var query = 'UPDATE contact_us set updated_date = ?, status = ? where id = ?;';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    new Date(),
                    Boolean(0),
                    Number(id)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async getAllMessageByStatus(id,status,date){
        var query = `SELECT id,full_name AS fullName,contact,message,created_date AS createdDate,updated_date AS updatedDate,status,read_status AS readStatus FROM contact_us WHERE id = ? AND readStatus = ? AND created_date like '%${date}' ORDER BY id DESC`;
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Number(id),
                    Boolean(status)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async getAllMessage(){
        var query = `SELECT id,full_name AS fullName,contact,message,created_date AS createdDate,updated_date AS updatedDate,status,read_status AS readStatus FROM contact_us WHERE status = true ORDER BY id DESC`;
        return await new Promise((resolve,reject)=>{
            db.query(query,
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }
}

module.exports=ContactMessage;