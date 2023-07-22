const db = require('../../config/db.config');
const dotenv = require('dotenv');
dotenv.config();

class Role {

    static async save(role){
        var query = "INSERT INTO user (name, status) VALUES (?, ?)";
        var date = new Date();
        return new Promise((resolve,reject)=>{
            db.query(query,
                [
                    role.name,
                    true
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async update(role){
        var query = "UPDATE user set name=?, status=? WHERE id=?";
        return new Promise((resolve,reject)=>{
            db.query(query,
                [
                    role.name,  
                    true, 
                    Number(role.id)],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async findAllRole(){
        var query = "SELECT id, name FROM role WHERE status=?";
        return new Promise((resolve,reject)=>{
            db.query(query, [true], (err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });

    }

    static async findById(id){
        var query = "SELECT id, name FROM role WHERE id=? and status = ?";
        return new Promise((resolve,reject)=>{
            db.query(query, [Number(id),true], (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async deleteById(id){
        var query = "UPDATE role set status=? WHERE id=?";
        return new Promise((resolve,reject)=>{
            db.query(query, [false, Number(id)], (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async validateRolename(username){
        var query = "SELECT count(id) as isExist FROM role WHERE name=? AND status=?";
        return await new Promise((resolve,reject)=>{
            db.query(query, [username.toLowerCase(), true], (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }
}

module.exports = Role;