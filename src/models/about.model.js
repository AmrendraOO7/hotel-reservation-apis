const db = require('../../config/db.config');

class About{

    //update about
    static async update(content){
        var query = "UPDATE about set content=? where id = 1; ";
      return await new Promise((resolve,reject)=>{
            db.query(query ,[content],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //get about us content
    static async getContent(){
        var query = "SELECT content FROM about ORDER BY id LIMIT 1";
      return await new Promise((resolve,reject)=>{
            db.query(query,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }
}

module.exports = About;
