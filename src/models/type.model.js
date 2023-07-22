const db = require('../../config/db.config');

class Floor {

    static async findAllFloor(){
        //find all floor
        const findAllQuery = "SELECT id, title from type WHERE status=?";
        return new Promise((resolve,reject)=>{
            db.query(findAllQuery, [true], (err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

}

module.exports = Floor;