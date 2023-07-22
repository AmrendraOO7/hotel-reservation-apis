const db = require('../../config/db.config');

class foodMenu{
    static async createFoodMenu(foodMenuData){
        //Insert Query
        var insertQuery =  'INSERT INTO food_menu (title,type,description,status,created_date,updated_date,price) VALUES (?,?,?,?,?,?,?)';
        var date = new Date();
        return new Promise((resolve,reject)=>{
            db.query(insertQuery,
                [
                    foodMenuData.title,
                    foodMenuData.type,
                    foodMenuData.description ? foodMenuData.description : null,
                    Boolean(true),
                    date,
                    date,
                    Number(foodMenuData.price)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    static async getAllFoodMenu(type,isClient){
        var getAllFoodMenu = `SELECT id, title,type,description,status,created_date AS createdDate,updated_date AS updatedDate,price FROM food_menu `;
        if(type === 'all' || type === 'All') getAllFoodMenu += `WHERE status = TRUE `;
        else getAllFoodMenu += `WHERE type LIKE '%${type}%' AND status = TRUE `;
        if(isClient == 1) getAllFoodMenu+= `AND type <> 'Laundry' AND type <> 'Damaged Item';`;
        else getAllFoodMenu+= `;`
        return new Promise((resolve,reject)=>{
            db.query(getAllFoodMenu,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    static async searchAllFoodMenu(name){
        var getAllFoodMenu = `SELECT id, title,type,description,status,created_date AS createdDate,updated_date AS updatedDate,price FROM food_menu WHERE status = TRUE AND title LIKE '%${name}%';`;
        return new Promise((resolve,reject)=>{
            db.query(getAllFoodMenu,(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    static async getFoodMenuByIds(id){
        var getFoodMenuId = `SELECT title,type,description,status,created_date AS createdDate,updated_date AS updatedDate,status, price FROM food_menu WHERE id = ?;`;
        return new Promise((resolve,reject)=>{
            db.query(getFoodMenuId,[Number(id)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    static async updateFoodMenus(foodMenuData){
        var updateFoodMenu =  `UPDATE food_menu SET title = ?, type = ?, description = ?,updated_date = ?, price=? WHERE id = ?;`;
        return new Promise((resolve,reject)=>{
        db.query(updateFoodMenu,
            [
                foodMenuData.title,
                foodMenuData.type,
                foodMenuData.description,
                new Date(),
                Number(foodMenuData.price),
                Number(foodMenuData.id)
               
            ],
            (err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    static async deleteFoodMenu(id){
        var deleteFoodMenu = `UPDATE food_menu SET status = ? WHERE id = ?;`;
        return new Promise((resolve,reject)=>{
            db.query(deleteFoodMenu,[Boolean(false),Number(id)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    };


}

module.exports = foodMenu;