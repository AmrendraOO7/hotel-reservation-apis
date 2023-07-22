const db = require('../../config/db.config');

class roomBill{

    static async saveBill(billData){
        var query = "INSERT INTO room_item_bill_master (room_no, name, mobile, address, disc_pc, disc_amt, vat_pc, vat_amt, payable_amt, words, status, bill_creator, created_date, updated_date ,gross_total, amt_after_disc, service_charge, delete_status, room_booking_id, current_room_status, service_charge_amount) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); SELECT id as id FROM room_item_bill_master ORDER BY id DESC LIMIT 1;";
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    billData.roomNo,
                    billData.name,
                    billData.mobile,
                    billData.address,
                    Number(0),
                    Number(0),
                    Number(13),
                    Number(0),
                    Number(0),
                    null,
                    Boolean(1),
                    billData.billCreator,
                    new Date(),
                    null,
                    Number(0),
                    Number(0),
                    Number(0),
                    Boolean(0),
                    billData.roomBookingId,
                    Boolean(1),
                    Number(0)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async masterBillUpdate(billData){
        var query = "UPDATE room_item_bill_master SET room_no = ?, name = ?, mobile = ?, address = ?, disc_pc = ?, disc_amt = ?, vat_amt = ?, payable_amt = ?, words = ?, status = ?, bill_creator = ?,  updated_date = ?, gross_total = ?, amt_after_disc = ?, service_charge = ?, service_charge_amount = ?,  room_booking_id = ?, current_room_status = ? WHERE id = ?";
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    billData.roomNo,
                    billData.name,
                    billData.mobile,
                    billData.address,
                    Number(billData.discPc),
                    Number(billData.discAmt),
                    Number(billData.vatAmt),
                    Number(billData.payableAmt),
                    billData.words,
                    Boolean(1),
                    billData.billCreator,
                    new Date(),
                    Number(billData.grossTotal),
                    Number(billData.amtAfterDisc),
                    Number(billData.serviceChargePc), //service charge percent in serviceCharge
                    Number(billData.serviceChargeAmt),
                    billData.roomBookingId,
                    Boolean(1),
                    Number(billData.id)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        }).catch(e => console.log(e));
    }

    static async deleteBillDetails(id){
        var query = "DELETE FROM room_item_bill_details WHERE id = ?"
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Number(id)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async saveBillDetails(id,itemName,rate,quantity,itemPrice,discPcItem,discAmtItem,totalItem){
        var query = "INSERT INTO room_item_bill_details (id,item_name,item_price,disc_pc,disc_amt,total,status,quantity,rate) VALUES(?,?,?,?,?,?,?,?,?);"
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Number(id),
                    itemName,
                    itemPrice,
                    discPcItem,
                    discAmtItem,
                    totalItem,
                    true,
                    quantity,
                    rate
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }



    static async getBillMasterBySearch(roomNo,mobile){
        var room = 'ROOM-'+Number(roomNo)
        var mobileNo = Number(mobile);
        var query = `SELECT id,room_no AS roomNo,name,mobile,address,disc_pc AS discPc,disc_amt AS discAmt,vat_pc AS vatPc,vat_amt AS vatAmt,payable_amt AS payableAmt,words,status,bill_creator AS billCreator,DATE_FORMAT(created_date,'%Y-%m-%d') AS createdDate,updated_date AS updatedDate,gross_total AS grossTotal,amt_after_disc AS amtAfterDisc,service_charge as serviceChargePc, service_charge_amount AS serviceChargeAmt FROM room_item_bill_master `
        if(roomNo > 0 && mobileNo > 0) query+=`WHERE room_no LIKE '${room}' OR mobile LIKE '${mobileNo}' ORDER BY id DESC;`;
        else if(mobileNo > 0) query+=`WHERE mobile LIKE '${mobileNo}' ORDER BY id DESC;`;
        else if(roomNo > 0) query+=`WHERE room_no LIKE '${room}' ORDER BY id DESC;`;
        else query+=';';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Number(roomNo) ? 'ROOM-'+Number(roomNo) : '',
                    mobileNo > 0 ? mobileNo : ''
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async getBillMasterById(id){
        var query = 'SELECT id,room_no AS roomNo,name,mobile,address,disc_pc AS discPc,disc_amt AS discAmt,vat_pc AS vatPc,vat_amt AS vatAmt,payable_amt AS payableAmt,words,status,bill_creator AS billCreator,created_date AS createdDate,updated_date AS updatedDate,gross_total AS grossTotal,amt_after_disc AS amtAfterDisc,service_charge as serviceChargePc,service_charge_amount AS serviceChargeAmt , delete_status AS deleteStatus, room_booking_id AS roomBookingId, current_room_status AS currentRoomStatus FROM room_item_bill_master WHERE room_booking_id = ?;'
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Number(id)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async getBillDetailsById(id){
        var query = 'SELECT id,item_name AS itemName,item_price AS itemPrice,disc_pc AS discPcItem,disc_amt AS discAmtItem,total as totalItem,status,quantity,rate FROM room_item_bill_details WHERE id = ? ORDER BY id ASC;'
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Number(id)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async checkAccountById(id){
        var query = 'SELECT COUNT(room_booking_id) AS count FROM room_item_bill_master WHERE room_booking_id = ? ORDER BY id ASC;'
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Number(id)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

}

/*
var query = ''
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [

                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
*/

module.exports =roomBill;