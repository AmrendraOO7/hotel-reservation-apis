const dbConn = require('../../config/db.config');
const dotenv = require('dotenv');
dotenv.config();

//Query Section

var getAllQuery = 'SELECT id,title,description,date,created_date AS createdDate,updated_date AS updatedDate,status, images FROM gallery WHERE status = TRUE;';

var getQueryById = 'SELECT title,description,date,created_date AS createdDate,updated_date AS updatedDate,status, images FROM gallery WHERE status = TRUE AND id=?;';

var insertQuery = 'INSERT INTO gallery (title,description,date,created_date,updated_date,status,images) VALUES (?,?,?,?,?,?,?);';

var updateQuery = 'UPDATE gallery SET title = ?, description = ?, updated_date = ?,  images = ? ,status = ? WHERE id = ?;';

var deleteQuery  = `UPDATE gallery SET status = ? WHERE id = ?;`;

class gallery{

    //get all gallary list
    static async getAllGallery(){
        return new Promise ((resolve,reject)=>{
            dbConn.query(getAllQuery, (err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //get gallery by id
    static async getGalleryById(id){
        return new Promise((resolve,reject)=>{
            dbConn.query(getQueryById,[Number(id)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }

    //create new gallery

    static async createNewGallery(gallaryData){
        var date = new Date();
        return new Promise((resolve,reject)=>{
            dbConn.query(insertQuery,
                [
                    gallaryData.title ? gallaryData.title:null,
                    gallaryData.description ? gallaryData.description:null,
                    gallaryData.eventDate ? gallaryData.eventDate : date,
                    date,
                    date,
                    Boolean(true),
                    gallaryData.images ? gallaryData.images : null
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    //update gallery
    static async updateGallery(galleryData){
        return new Promise((resolve,reject)=>{
            dbConn.query(updateQuery,
                [
                    galleryData.title ? galleryData.title:null,
                    galleryData.description ? galleryData.description:null,
                    new Date(),
                    Boolean(true),
                    Number(galleryData.id)
                ],
                (err,res)=>{
                    if(err) reject(err);
                    else resolve(res);
                });
        });
    }

    //delete gallary
    static async deleteGallery(id){
        return new Promise((resolve,reject)=>{
            dbConn.query(deleteQuery,[Boolean(false),Number(id)],(err,res)=>{
                if(err) reject(err);
                else resolve(res);
            });
        });
    }
        
}

module.exports = gallery;