const roomNumberGenerationModel = require('../models/roomNumberGeneration.model');
const roomSettingModel = require('../models/setting/room.setting.model');
const { apiCallBack } = require('../middleware/helper');
const {REQUIRED_FIELDS, INFO_CODE } = require('../middleware/strings');


async function numberGeneration(floorId){
    return await new Promise((resolve, reject) => {
        roomNumberGenerationModel.generateRoomNumber(floorId).then(async result => {
            if(result && result.length>0){
                const roomCount = result[0]['roomCount'];
                await roomSettingModel.getAllActiveRoomsById(floorId).then(roomData=>{
                    var roomPrefix = roomData[0]['roomPrefix'];
                    var roomStartNumber = roomData[0]['roomStartNumber'];
                    if(roomPrefix && roomStartNumber) {
                        var numberStartsAfter = Number(roomStartNumber) + Number(roomCount);
                        const data = {roomPrefix,numberStartsAfter};    
                        resolve(data);
                    } else reject('Either room prefix or start number not found.');          
                }).catch(e => reject(e));
            } else  reject('No data found');
        }).catch(e => reject(e));
    });
    
}





module.exports={numberGeneration}

