const db = require('../../config/db.config');

class Table{

    static async createNewTable(table){
        const query = "INSERT INTO resturant_table (title, type_id, created_date, updated_date,status) VALUES(?, ?, ?, ?, ?)";
        const date = new Date();
        return new Promise((resolve,reject)=>{
            db.query(query,
                [
                    table.title, 
                    Number(table.typeId), 
                    date,
                    date, 
                    true
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async checkTitleExistanceOnUpdate(id,title){
        const query = 'SELECT COUNT(id) AS output FROM resturant_table WHERE id <> ? AND title = ?  AND status = ?';
        return new Promise((resolve,reject)=>{
            db.query(query, [Number(id) ,title, Boolean(true)],(err,res)=>{
                var exist = false;
                if(res[0]["output"] === 1) exist = true;
                if(err) reject(err);
                else resolve(exist);
            });
        }); 
    }

    static async updateTable(table){
        const query = "UPDATE resturant_table set title = ?, type_id = ?, updated_date=? WHERE id = ?";
        const date = new Date();
        return new Promise((resolve,reject)=>{
            db.query(query,
                [
                    table.title,
                    Number(table.typeId), 
                    date, 
                    Number(table.id)
                ],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    };

    static async findAllTables(type){
        var query = "SELECT rt.id, rt.title, rt.type_id as typeId, (SELECT title FROM type WHERE id = rt.type_id) AS type, rt.created_date AS createdDate, rt.updated_date AS updatedDate FROM resturant_table rt WHERE status=? ";
        var dataSets = [Boolean(true)];
        if(type !== null) {
            query += " AND type=?";
            dataSets.push(type);
        }
        query += " ORDER BY title, type";
        return new Promise((resolve,reject)=>{
            db.query(query, dataSets ,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    };

    static async findById(id){
        const query = "SELECT rt.id, rt.title, rt.type_id as typeId, (SELECT title FROM type WHERE id = rt.type_id) AS type, rt.created_date AS createdDate, rt.updated_date AS updatedDate FROM resturant_table rt WHERE rt.id= ?";
        return new Promise((resolve,reject)=>{
            db.query(query,[Number(id)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    };

    static async findBytypeId(id){
        const query = "SELECT rt.id, rt.title, rt.type_id as typeId, (SELECT title FROM type WHERE id = rt.type_id) AS type, rt.created_date AS createdDate, rt.updated_date AS updatedDate FROM resturant_table rt WHERE rt.type_id = ?";
        return new Promise((resolve,reject)=>{
            db.query(query,[Number(id)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    };

    static async deleteTable(id){
        const query = "UPDATE resturant_table set status=? WHERE id=?";
        return new Promise((resolve,reject)=>{
            db.query(query,[Boolean(false),Number(id)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    };

    static async isTableTitleAlreadyExist(title){
        const query = "SELECT count(id) AS total FROM resturant_table WHERE title=? AND status=?";
        return new Promise((resolve,reject)=>{
            db.query(query, [title, true],(err,res)=>{
                var exist = false;
                if(res[0]["total"] === 1) exist= true;
                if(err) reject(err);
                else resolve(exist);
            });
        }); 
    }

    static async countTotalTable(){
        const query = "SELECT count(id) AS total FROM resturant_table WHERE status=?";
        return new Promise((resolve,reject)=>{
            db.query(query,[true],(err,res)=>{
                if(err) reject(err);
                else resolve(res[0]["total"]);
            });
        });   
    }

}

module.exports = Table;