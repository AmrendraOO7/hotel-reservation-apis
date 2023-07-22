const tableSettingModel = require('../models/setting/table.setting.model');
const helper = require('../middleware/helper');
const string = require ('../middleware/strings');
const {apiCallBack} = helper;
const {INFO_CODE,ERROR_500,SUCCESS_CODE,REQUIRED_FIELDS} = string;


async function findAll(_req,res){
    await tableSettingModel.findTableSetting().then(result=>{
        return apiCallBack(res,result,null,SUCCESS_CODE);
    }).catch(_e=>{
        return apiCallBack(res,null,ERROR_500.message,ERROR_500.code);
    });
}


async function update(req,res){
    var tableSetting = req.body[0];
    if(!tableSetting || Object(tableSetting).length === 0) return apiCallBack(res,null,REQUIRED_FIELDS,INFO_CODE);
    if(tableSetting.id === null || !tableSetting.prefix || !tableSetting.startNumber) return apiCallBack(res, null, "Required prefix and start number to update setting.",INFO_CODE)
    await tableSettingModel.updateTableSetting(tableSetting).then(()=>{
        return apiCallBack(res,null,string.SUCCESS_MESSAGE.update,SUCCESS_CODE);
    }).catch(_e =>{
        return apiCallBack(res,null,ERROR_500.message,ERROR_500.code);
    });
}

module.exports = {findAll, update};
