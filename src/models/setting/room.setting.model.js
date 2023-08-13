const db = require('../../../config/db.config')

class RoomSetting {

    //all room setting 
    static async findAllRoomSettings(){
        const query = "SELECT rs.id, rs.room_prefix AS roomPrefix, rs.room_start_number AS roomStartNumber, rs.floor_id AS floorId , f.title as floorName FROM room_setting rs LEFT OUTER JOIN floor f ON rs.floor_id = f.id";
        return new Promise((resolve,reject)=>{
            db.query(query,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    };

    //find by id
    static async findRoomSettingFloorById(floorId){
        const query = "SELECT id, room_prefix AS roomPrefix,room_start_number AS roomStartNumber, floor_id AS floorId from room_setting WHERE floor_id=?";
        return new Promise((resolve,reject)=>{
            db.query(query, [Number(floorId)] ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //update
    static async updateRoomSetting(roomSettingData){
        //update room setting
        const query = `UPDATE room_setting SET room_prefix = ? , room_start_number = ? WHERE id = ?;`;

        return new Promise((resolve,reject)=>{
            db.query(query,
                [
                    roomSettingData.roomPrefix ? roomSettingData.roomPrefix : null,
                    Number(roomSettingData.roomStartNumber),
                    Number(roomSettingData.id)
                ],
                (err,res)=>{
                    //console.log(err,res);
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

}

module.exports = RoomSetting;