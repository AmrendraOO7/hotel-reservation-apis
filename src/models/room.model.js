const db = require('../../config/db.config');

class Room{

    static async createNewRoom(room){
        const query = "INSERT INTO room (title, type_id, category_id, floor_id, description,price,images,created_date,updated_date,status,room_status_id) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        const date = new Date();
        return new Promise((resolve,reject)=>{
            db.query(query,
                [room.title, Number(room.typeId), Number(room.categoryId), 
                 Number(room.floorId), room.description, Number(room.price), room.images,
                 date, date, true, Number(6)
                ],
                (err,res)=>{
                    console.log(err,res,'model line 15')
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async checkTitelExistanceOnUpdate(id,title,floorId){
        const query = 'SELECT COUNT(id) AS output FROM room WHERE id <> ? AND title = ? AND floor_id = ? AND status = ?';
        return new Promise((resolve,reject)=>{
            db.query(query, [Number(id) ,title, Number(floorId), Boolean(true)],(err,res)=>{
                var exist = false;
                if(res[0]["output"] === 1) exist = true;
                if(err) reject(err);
                else resolve(exist);
            });
        }); 
    }

    static async updateRoom(room){
        const query = "UPDATE room set title=?, type_id=?, category_id=?, floor_id=?, description=?, price=?, updated_date=? WHERE id=?";
        const date = new Date();
        return new Promise((resolve,reject)=>{
            db.query(query,
                [room.title, room.typeId, room.categoryId, room.floorId, room.description,
                 Number(room.price), date, Number(room.id)   
                ],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    };

    static async findAllRoomsList(floorId, typeId, categoryId){
        var query = `SELECT r.id, r.title, (SELECT f.title FROM floor as f WHERE f.id=r.floor_id) AS floorName, (SELECT t.title FROM type t WHERE t.id=r.type_id) AS typeName, (SELECT c.title FROM category c WHERE c.id=r.category_id) categoryName, description, price, images FROM room r WHERE r.status=? `
        var dataSets = [Boolean(true)];
        if(floorId !== null){
            query += " AND floor_id=? ";
            dataSets.push(floorId);
        }
        if(typeId !== null){
            query += " AND type_id=? ";
            dataSets.push(typeId);
        }
        if(categoryId !== null){
            query += " AND category_id=?";
            dataSets.push(categoryId);
        }
        query += " ORDER BY r.title,r.floor_id,r.type_id,r.category_id ";
        return new Promise((resolve,reject)=>{
            db.query(query, dataSets ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    };

    static async findAllRooms(floorId){
        var query = "SELECT id, title,type_id AS typeId, category_id AS categoryId,description,price,images FROM room WHERE status = ? AND floor_id = ? ORDER BY title";
        return new Promise((resolve,reject)=>{
            db.query(query,[true, floorId] ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    };

    static async findById(id){
        const query = "SELECT id, title,floor_id AS floorId, type_id AS typeId, category_id AS categoryId,description,price,images FROM room WHERE id=?";
        return new Promise((resolve,reject)=>{
            db.query(query,[Number(id)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    };

    static async deleteRoom(id){
        const query = "UPDATE room set status=? WHERE id=?";
        return new Promise((resolve,reject)=>{
            db.query(query,[Boolean(false),Number(id)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    };

    static async isRoomTitleAlreadyExist(title, floorId){
        const query = "SELECT count(id) AS total FROM room WHERE title=? AND floor_id=? AND status=?";
        return new Promise((resolve,reject)=>{
            db.query(query, [title, Number(floorId), true],(err,res)=>{
                var exist = false;
                if(res[0]["total"] === 1) exist= true;
                if(err) reject(err);
                else resolve(exist);
            });
        }); 
    }

    static async countTotalRoom(floorId){
        const query = "SELECT count(id) AS total FROM room WHERE floor_id=? AND status=?";
        return await new Promise((resolve,reject)=>{
            db.query(query,[Number(floorId), true],(err,res)=>{
                if(err) reject(err);
                else resolve(res[0]["total"]);
            });
        });   
    }

    static async currentStatusUpdate(statusId,id){
        if(statusId == 4 || statusId == 5) var midQuery = ',status = 0';
        else  var midQuery = ',status = 1';
        const query=`UPDATE room set room_status_id = ? ${midQuery} WHERE id = ?`;
        return await new Promise((resolve,reject)=>{
            db.query(query,
                [
                    Number(statusId),
                    Number(id)
                ],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });   
    }

    static async getListOfDistinctCategoryId(){
        const query=`SELECT DISTINCT(category_id) AS categoryId FROM room;`;
        return await new Promise((resolve,reject)=>{
            db.query(query,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });   
    }

    static async getListOfDistinctRooms(categoryId){
        const query=`SELECT title AS roomName, images,category_id as categoryId,(select c.title from category c where c.id = ?) AS category, price, description FROM room where category_id = ? LIMIT 1;`;
        return await new Promise((resolve,reject)=>{
            db.query(query,[Number(categoryId),Number(categoryId)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });   
    }

}

module.exports = Room;