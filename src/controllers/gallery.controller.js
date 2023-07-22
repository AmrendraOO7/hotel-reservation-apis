const { apiCallBack } = require('../middleware/helper');
const string = require ('../middleware/strings.js');
const GalleryModel = require('../models/gallery.model');

//get all gallary list
async function getAllGalleryList(req,res){
    await GalleryModel.getAllGallery().then(result=>{
        if(result.length ==0) return apiCallBack(res,null,null,string.INFO_CODE);
            return apiCallBack(res,result,null,string.SUCCESS_CODE);
    }).catch(_e=>{
        return apiCallBack(res,null,string.ERROR_500.message,string.ERROR_500);
    });
}

//get gallery by id
async function getGalleryById(req,res){
    var id = req.query.id;
    if(!id || id==0) return apiCallBack(res,null,'Id cannot be zero',string.INFO_CODE);
    await GalleryModel.getGalleryById(id).then(result=>{
        if(result.length>0) return apiCallBack(res,result[0],null,string.SUCCESS_CODE);
        return apiCallBack(res,null,null,string.INFO_CODE);
    }).catch(_e=>{
        return apiCallBack(res,null,string.ERROR_500.message,string.ERROR_500);
    });
}

//create new Gallery
async function createNewGallery(req,res){
    var gallaryData = req.body;
    if(!gallaryData || Object(gallaryData).length === 0) return apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    if(!gallaryData.title) return apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);    
    await GalleryModel.createNewGallery(gallaryData).then(()=>{
        return apiCallBack(res,null,string.SUCCESS_MESSAGE.save,string.SUCCESS_CODE);
    }).catch(_e=>{
        return apiCallBack(res,null,string.ERROR_500.message,string.ERROR_500);
    });
}


// update gallery
async function updateGalleryById(req,res){
    var gallaryData = req.body;
    if(!gallaryData || Object(gallaryData).length === 0)
    return apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    if(!gallaryData.title) return apiCallBack(res,null,string.REQUIRED_FIELDS,string.INFO_CODE);
    await GalleryModel.updateGallery(gallaryData).then(()=>{
        return apiCallBack(res,null,string.SUCCESS_MESSAGE.update,string.SUCCESS_CODE);
    }).catch(_e=>{
        return apiCallBack(res,null,string.ERROR_500.message,string.ERROR_500);
    });
}

//delete gallery
async function deleteGalleryById(req,res){
    var id = req.query.id;
    if(!id || id == 0) return apiCallBack(res,null,'Id cannot be zero',string.INFO_CODE);
    await GalleryModel.deleteGallery(id).then(()=>{
        return apiCallBack(res,null,string.SUCCESS_MESSAGE.update,string.SUCCESS_CODE);
    }).catch(_e=>{
        return apiCallBack(res,null,string.ERROR_500.message,string.ERROR_500);
    });
}

module.exports = {getAllGalleryList,getGalleryById,createNewGallery,updateGalleryById,deleteGalleryById};