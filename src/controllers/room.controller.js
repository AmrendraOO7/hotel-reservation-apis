const roomModel = require('../models/room.model');
const helper = require ('../middleware/helper.js');
const string = require ('../middleware/strings.js');
const { apiCallBack } = helper;
const { SUCCESS_CODE, SUCCESS_MESSAGE, REQUIRED_FIELDS, ERROR_500, INFO_CODE } = string;

//create function for new room
async function createNewRoom(req,res){
    const room = req.body;
    console.log(room)
    if(!room || Object(room).length === 0) return apiCallBack(res,null,REQUIRED_FIELDS,INFO_CODE);
    if(room.floorId === null || room.noOfRoom === null || room.typeId === null || room.categoryId === null || room.price === null)
        return apiCallBack(res,null,REQUIRED_FIELDS,INFO_CODE);
    var roomTitleArray = await helper.getArrayOfRoomNumber(room.noOfRoom, room.floorId);
    if(roomTitleArray === null || roomTitleArray.length <= 0) 
        return apiCallBack(res, null, "Failed to generate room title.Contact Support team.", INFO_CODE);
    for(var i=0; i < roomTitleArray.length; i++){
        room['title'] = roomTitleArray[i];
        await roomModel.createNewRoom(room).then( () => {
        }).catch(e => {
            console.log(e,'line 21')
            return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
        })
    }     
    return apiCallBack(res, null, SUCCESS_MESSAGE.save, SUCCESS_CODE);  
}

//upadate room
async function updateRoomById(req,res){
    var roomData = req.body;
    if(!roomData || Object(roomData).length === 0)
        return apiCallBack(res,null,REQUIRED_FIELDS,INFO_CODE);
    if(roomData.id === null || roomData.floorId === null || !roomData.title || roomData.typeId === null || roomData.categoryId === null || roomData.price === null)
        return apiCallBack(res,null,REQUIRED_FIELDS,INFO_CODE);
    await roomModel.checkTitelExistanceOnUpdate(roomData.id,roomData.title,roomData.floorId).then(async exist=>{
        if(exist === false){
            await roomModel.updateRoom(roomData).then(()=>{
                return apiCallBack(res,null,SUCCESS_MESSAGE.update,SUCCESS_CODE);
            }).catch(_e => {
                return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
            });
        }
        else apiCallBack(res,null,'Title you are trying to put is already in use.',string.INFO_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    });
}

//get room List by floor
async function getRoomList(req,res){
    var floorId = req.query['floorId'];
    if(floorId === null) return apiCallBack(res,null,'Select floor to filter room.',INFO_CODE);
    await roomModel.findAllRooms(floorId).then(result => {
        return apiCallBack(res,result,null,SUCCESS_CODE);    
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    })
}

//get room List
async function getAllRoomList(req,res){
    var floorId = req.query['floorId'];
    var typeId = req.query['typeId'];
    var categoryId = req.query['categoryId'];
    await roomModel.findAllRoomsList(floorId, typeId, categoryId).then(result => {
        return apiCallBack(res,result,null,SUCCESS_CODE);    
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    })
}

//get room by id
async function getRoomById(req,res){
    var id = req.query.id;
    if(id === null) return apiCallBack(res,null,'Sorry but Id not found to featch data.',INFO_CODE);
    await roomModel.findById(id).then(result=>{
        if(result.length > 0) return apiCallBack(res,result[0],null,SUCCESS_CODE);
        else return apiCallBack(res,null,null,SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    });
}

//get delete room by id
async function deleteRoomById(req,res){
    var id = req.query.id;
    if(id === null) return apiCallBack(res,null,'Id not found to featch data.',INFO_CODE);
    await roomModel.deleteRoom(id).then(()=>{
        return apiCallBack(res,null,SUCCESS_MESSAGE.delete,SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    })
}


async function updateRoomStatus(req,res){
    const statusId = req.query.statusId;
    const id =  req.query.roomId;
    if((!statusId && statusId == 0) || (!id && id == 0)) return apiCallBack(res,null,REQUIRED_FIELDS,INFO_CODE);
    await roomModel.currentStatusUpdate(statusId, id).then(()=>{
        return apiCallBack(res,null,SUCCESS_MESSAGE.update,SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    })
}

//room for display
async function getDistinctRooms(req,res){
    var listOfRoom = [];
    await roomModel.getListOfDistinctCategoryId().then(async categoryId =>{
        for(var i=0; i < categoryId.length; i++){
            var newCategoryId = (categoryId[i]['categoryId']);
            await roomModel.getListOfDistinctRooms(newCategoryId).then(roomName => {
                var newRoomName = roomName[0]["roomName"];
                var newImages = roomName[0]["images"];
                var newCatergory = roomName[0]["category"];
                var newPrice = roomName[0]["price"];
                var newDescription = roomName[0]["description"];
                var newCategoryId = roomName[0]["categoryId"];
                listOfRoom.push({ roomName: newRoomName, image: newImages, category: newCatergory, price: newPrice, description: newDescription, categoryId:newCategoryId });
            }).catch(_e => {
            return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
            });
        }
        return apiCallBack(res,listOfRoom,null,SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    });
}

module.exports = { createNewRoom, updateRoomById, getRoomById, getRoomList, deleteRoomById, getAllRoomList, updateRoomStatus , getDistinctRooms};
