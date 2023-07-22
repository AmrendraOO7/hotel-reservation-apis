const { apiCallBack } = require('../middleware/helper');
const { SUCCESS_CODE, ERROR_500, SUCCESS_MESSAGE } = require('../middleware/strings');
const aboutModel = require('../models/about.model');

//update
async function update(req,res){
    var content = req.body.content;
    if(content === null || !content) return apiCallBack(res, null," Content required to Update",SUCCESS_CODE);
    await aboutModel.update(content).then( () => {
        return apiCallBack(res,null, SUCCESS_MESSAGE.update, SUCCESS_CODE); 
    }).catch(_e=>{
        return apiCallBack(res,null,ERROR_500.message,ERROR_500.code);
    });
}

//get content
async function getContent(req,res){
    await aboutModel.getContent().then( result => {
        return apiCallBack(res, result[0], null, SUCCESS_CODE);
    }).catch(_e=>{
        return apiCallBack(res,null,ERROR_500.message,ERROR_500.code);
    });
}

module.exports = {update, getContent};