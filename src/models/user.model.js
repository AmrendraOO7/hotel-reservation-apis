const db = require('../../config/db.config');
const dotenv = require('dotenv');
dotenv.config();

class User {

    static async save(user){
        var query = "INSERT INTO user (name, username, password, mobile, email, address, role_id, created_date, updated_date, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
        var date = new Date();
        return new Promise((resolve,reject)=>{
            db.query(query,
                [
                    user.name, 
                    user.userName.toLowerCase(), 
                    user.password, 
                    user.mobile, 
                    user.email, 
                    user.address, 
                    Number(user.roleId), 
                    date, 
                    date , 
                    true
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async update(user){
        var query = "UPDATE user set name=?, mobile=?,address=?, updated_date=?, status=? WHERE id=?";
        var date = new Date();
        return new Promise((resolve,reject)=>{
            db.query(query,
                [
                    user.name, 
                    user.mobile, 
                    user.address, 
                    date , 
                    true, 
                    Number(user.id)],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async findAllByRoleId(roleId){
        var query = "SELECT id, name, username, mobile, email, address,created_date as createdDate, updated_date as updatedDate FROM user WHERE role_id=? AND status=?";
        return new Promise((resolve,reject)=>{
            db.query(query, [Number(roleId), true], (err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });

    }

    static async findById(id){
        var query = "SELECT id, name, username, mobile, email, address,created_date as createdDate, updated_date as updatedDate FROM user WHERE id=?";
        return new Promise((resolve,reject)=>{
            db.query(query, [Number(id)], (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async getOneCustomerByUsername(username ){
        var query = "SELECT id, username, password FROM user WHERE username=? AND status=? AND role_id=(SELECT r.id FROM role r WHERE LOWER(r.name)=?)";
        return new Promise((resolve,reject)=>{
            db.query(query, 
                [
                    username,
                    true,
                    'customer'
                ],
                (err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });

    }

    static async getOneAdminByUsername(username ){
        var query = "SELECT id, username, password FROM user WHERE username=? AND status=? AND role_id IN (SELECT r.id FROM role r WHERE LOWER(r.name) !=?)";
        return new Promise((resolve,reject)=>{
            db.query(query, [username, true, 'customer'], (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async deleteById(id){
        var query = "UPDATE user set status=? WHERE id=?";
        return new Promise((resolve,reject)=>{
            db.query(query, [false, Number(id)], (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async validateUsername(username){
        var query = "SELECT count(id) as isExist FROM user WHERE username=? AND status=?";
        return await new Promise((resolve,reject)=>{
            db.query(query, [username.toLowerCase(), true], (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }

    static async getCompanyDetails(id){
        var query = "SELECT companyName,registrationNo,companyAddress,companyContact,validFrom,validUpTo,companyStarRating FROM companyprofile WHERE id = ?;";
        return new Promise((resolve,reject)=>{
            db.query(query, [Number(id)], (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });

    }
}

module.exports = User;