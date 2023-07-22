const db = require('../../config/db.config');

function getQuery(tableName){
    return `select id, title, status from ${tableName} WHERE status=?;`
}

function getQueryById(tableName){
    return `select id, title, status from ${tableName} WHERE id = ? and status=?;`
}

class CategoryAndType{


    //get table data according to table name 
    static async getAllRoomCategoryOrType(tableName){
      return await new Promise((resolve,reject)=>{
            db.query(getQuery(tableName), [true],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

     //get table data according to table name and by id 
     static async getAllRoomCategoryOrTypeById(tableName,id){
        return await new Promise((resolve,reject)=>{
              db.query(getQueryById(tableName), [Number(id), true],(err,res)=>{
                  if(err) reject(err);
                  else resolve(res);
              });
          });
      }
}

module.exports = CategoryAndType;
