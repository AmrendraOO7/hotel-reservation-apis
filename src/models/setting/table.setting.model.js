const db = require('../../../config/db.config')

class TableSetting {

    //find by id
    static async findTableSetting(){
        const query = "SELECT id, prefix AS prefix,start_number AS startNumber from resturant_table_setting ORDER BY id limit 1";
        return new Promise((resolve,reject)=>{
            db.query(query, [],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //update
    static async updateTableSetting(tableSetting){
        //update table setting
        const query = `UPDATE resturant_table_setting SET prefix = ? ,start_number = ? WHERE id = ?;`;
        return new Promise((resolve,reject)=>{
            db.query(query,
                [
                    tableSetting.prefix, 
                    Number(tableSetting.startNumber),
                    Number(tableSetting.id)
                ],
                (err,res)=>{
                    //console.log(err,res);
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    //create table

}

module.exports = TableSetting;