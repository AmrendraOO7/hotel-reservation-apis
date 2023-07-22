const roomSettingModel = require('../models/setting/room.setting.model');
const helper = require('../middleware/helper');
const string = require ('../middleware/strings');
const {apiCallBack} = helper;
const {INFO_CODE,ERROR_500,SUCCESS_CODE,REQUIRED_FIELDS} = string;

//get all room setting
async function findAllRoomSettings(_req,res){  
    await roomSettingModel.findAllRoomSettings().then(result=>{
        return apiCallBack(res, result,null, SUCCESS_CODE);
    }).catch(_e =>{
        return apiCallBack(res,null,ERROR_500.message,ERROR_500.code);
    });
}

async function findRoomSettingByFloorId(req,res){
    if(floorId === null) return helper.apiCallBack(req, null, "Required floor Id to find data.")
    await roomSettingModel.findRoomSettingFloorById(floorId).then(result=>{
        return apiCallBack(res,result,null,SUCCESS_CODE);
    }).catch(_e=>{
        return apiCallBack(res,null,ERROR_500.message,ERROR_500.code);
    });
}


async function updateRoomSetting(req,res){
    var roomSettingDatas = req.body;
    if(!roomSettingDatas || Object(roomSettingDatas).length === 0) return apiCallBack(res,null,REQUIRED_FIELDS,INFO_CODE);
    
    var validate = Boolean(true);
    for(var i=0; i < roomSettingDatas.length; i++){
        var roomSettingData = roomSettingDatas[i];
        if(roomSettingDatas.id === null || !roomSettingData.roomPrefix || !roomSettingData.roomStartNumber)
            return apiCallBack(res, null, "required prefix and start number to update seeting.")
        await roomSettingModel.updateRoomSetting(roomSettingData).then(()=>{
            
        }).catch(_e =>{
            validate = false;
            return apiCallBack(res,null,ERROR_500.message,ERROR_500.code);
        });
    }
    if(validate) return apiCallBack(res,null,string.SUCCESS_MESSAGE.update,SUCCESS_CODE);
}

module.exports = {findAllRoomSettings, findRoomSettingByFloorId, updateRoomSetting};
