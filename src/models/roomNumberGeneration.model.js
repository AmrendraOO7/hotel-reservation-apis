const db = require('../../config/db.config');

class roomNumberGeneration{
    static async generateRoomNumber(floorId){
        var roomCount = `SELECT COUNT(id) AS roomCount FROM room WHERE floor_id = ?`;
        return await new Promise((resolve,reject) => {
            db.query(roomCount,[Number(floorId)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }
}

module.exports = roomNumberGeneration;
