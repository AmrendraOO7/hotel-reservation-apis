const db = require('../../config/db.config');

class tableBill{

    // static async saveBill(billData){
    //     console.log(billData,'save master bill model line 6')
    //     var query = "INSERT INTO table_item_bill_master (table_no, name, mobile, address, disc_pc, disc_amt, vat_pc, vat_amt, payable_amt, words, status, bill_creator, created_date, updated_date ,gross_total, amt_after_disc, service_charge, delete_status, table_booking_id, current_table_status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); SELECT id as id FROM table_item_bill_master ORDER BY id DESC LIMIT 1;";
    //     return await new Promise((resolve,reject)=>{
    //         db.query(query,
    //             [
    //                 billData.tableNo,
    //                 billData.name,
    //                 billData.mobile,
    //                 billData.address,
    //                 Number(0),
    //                 Number(0),
    //                 Number(13),
    //                 Number(0),
    //                 Number(0),
    //                 null,
    //                 Boolean(1),
    //                 billData.billCreator,
    //                 new Date(),
    //                 null,
    //                 Number(0),
    //                 Number(0),
    //                 Number(0),
    //                 Boolean(0),
    //                 billData.tableBookingId,
    //                 Boolean(1)
    //             ],
    //             (err,res)=>{
    //                 console.log(err,res);
    //                 if(err) reject(err);
    //                 else resolve(res);
    //             });
    //     });
    // } 
    // table account open on the checkIn
    static async tableAccountOpen(tableData){
        var query='INSERT INTO table_item_bill_master (table_no, name, mobile, address, disc_pc, disc_amt, vat_pc, vat_amt, payable_amt, words, status, bill_creator, created_date, updated_date, gross_total, amt_after_disc, service_charge, delete_status, table_booking_id, current_table_status) VALUES((SELECT title FROM resturant_table WHERE id = ?),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); ';
        return await new Promise((resolve, reject)=>{
            db.query(query,
                [
                    tableData.tableId,
                    tableData.fullName,
                    tableData.mobile,
                    tableData.address,
                    Number(0),
                    Number(0),
                    Number(13),
                    Number(0),
                    Number(0),
                    null,
                    Boolean(1),
                    null, // bill creator here
                    new Date(),
                    new Date(),
                    Number(0),
                    Number(0),
                    Number(0),
                    Boolean(0), // if deleted boolean 1
                    Number(tableData.id),
                    tableData.bookingStatus
                ]
                ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }


    static async masterBillUpdate(billData){
        var query = `UPDATE table_item_bill_master SET disc_pc = ?, disc_amt = ?, vat_pc = ?, vat_amt = ?, payable_amt = ?, words = ?, bill_creator = ?, updated_date = ?, 
        gross_total = ?, amt_after_disc = ?, service_charge = ?, service_charge_amount = ? WHERE id = ?;`;
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Number(billData.discPc),
                    Number(billData.discAmt),
                    Number(billData.vatPc),
                    Number(billData.vatAmt),
                    Number(billData.payableAmt),
                    billData.words,
                    billData.billCreator,
                    new Date(),
                    Number(billData.grossTotal),
                    Number(billData.discAmt),
                    Number(billData.serviceChargePc),
                    Number(billData.serviceChargeAmt),
                    Number(billData.id)
                    
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        }).catch(e => console.log(e));
    }

    static async deleteBillDetails(id){
        var query = "DELETE FROM table_item_bill_details WHERE id = ?"
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
        var query = "INSERT INTO table_item_bill_details (id,item_name,item_price,disc_pc,disc_amt,total,status,quantity,rate) VALUES(?,?,?,?,?,?,?,?,?);"
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



    static async getBillMasterBySearch(tableNo,mobile){
        var table = 'TABLE-'+Number(tableNo)
        var mobileNo = Number(mobile);
        var query = `SELECT id,table_no AS tableNo,name,mobile,address,disc_pc AS discPc,disc_amt AS discAmt,vat_pc AS vatPc,vat_amt AS vatAmt,payable_amt AS payableAmt,words,status,bill_creator AS billCreator,created_date AS createdDate,updated_date AS updatedDate,gross_total AS grossTotal,amt_after_disc AS amtAfterDisc,service_charge as serviceChargePc, service_charge_amount As serviceChargeAmt FROM table_item_bill_master `
        if(tableNo > 0 && mobileNo > 0) query+=`WHERE table_no LIKE '${table}' OR mobile LIKE '${mobileNo}' ORDER BY id DESC;`;
        else if(mobileNo > 0) query+=`WHERE mobile LIKE '${mobileNo}' ORDER BY id DESC;`;
        else if(tableNo > 0) query+=`WHERE table_no LIKE '${table}' ORDER BY id DESC;`;
        else query+=';';
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Number(tableNo) ? 'TABLE-'+Number(tableNo) : '',
                    mobileNo > 0 ? mobileNo : ''
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async getBillMasterById(id){
        var query = 'SELECT id,table_no AS tableNo,name,mobile,address,disc_pc AS discPc,disc_amt AS discAmt,vat_pc AS vatPc,vat_amt AS vatAmt,payable_amt AS payableAmt,words,status,bill_creator AS billCreator,created_date AS createdDate,updated_date AS updatedDate,gross_total AS grossTotal,amt_after_disc AS amtAfterDisc,service_charge as serviceChargePc, service_charge_amount As serviceChargeAmt, delete_status AS deleteStatus, table_booking_id AS tableBookingId, current_table_status AS currentTableStatus FROM table_item_bill_master WHERE table_booking_id = ?;'
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
        var query = 'SELECT id,item_name AS itemName,item_price AS itemPrice,disc_pc AS discPcItem,disc_amt AS discAmtItem,total AS totalItem,status,quantity,rate FROM table_item_bill_details WHERE id = ? ORDER BY id ASC;'
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Number(id)
                ],
                (err,res)=>{
                    console.log(err,res,'getBillDetailsById');
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async checkAccountById(id){
        var query = 'SELECT COUNT(table_booking_id) AS count FROM table_item_bill_master WHERE table_booking_id = ? ORDER BY id ASC;'
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

module.exports =tableBill;