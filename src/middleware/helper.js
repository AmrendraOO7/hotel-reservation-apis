const roomSettingModel = require( '../models/setting/room.setting.model');
const roomModel = require('../models/room.model');
const tableSettingModel = require('../models/setting/table.setting.model');
const tableModel = require('../models/table.model');


apiCallBack = (res, body, message, status) => {
  return res.json({ body: body, message: message, status: status });
}

// handle to auto generate room title
async function getArrayOfRoomNumber(noOfRoom, floorId) {
  var roomTitleArray = [];
  //console.log(floorId);
  const setting = await getRoomSetting(floorId); 
  //console.log(setting,'::Setting data::')
  var totalRoom = await roomModel.countTotalRoom(floorId);
  //console.log(setting,totalRoom,'::line 15::');
  if((setting && setting.length <= 0) ||(!totalRoom && totalRoom<0)) return null;
  var roomstart = setting[0]['roomStartNumber'];
  var roomPrefix = setting[0]['roomPrefix'];
  if(roomstart === null || roomPrefix === null) return null;
  totalRoom = Number(totalRoom) > 0 ? Number(totalRoom)  : Number(totalRoom); /// THIS IS WORKING FINE DONT TOUCH IT [tested].
  var startNumber = Number(roomstart) + Number(totalRoom);
  var index = 0;
  for(var i= 0; i < Number(noOfRoom); i++){
    var title = "";
    do{
      title = roomPrefix+ (Number(startNumber) + Number(index));
      index++;
    }while (!await isAlreadyPresent(title, floorId));
    roomTitleArray.push(title);
  }
  return roomTitleArray;
}

async function getRoomSetting(floorId){
  var data = null;
  await roomSettingModel.findRoomSettingFloorById(floorId).then(result => {
     data = result;
  }).catch(e => {
    console.log(e);
  })
  return data;
}

async function countTotalRoom(floorId){
  var data = null;
  await roomModel.countTotalRoom(floorId).then( result => {
    data = result;
  }).catch(e => {
    console.log(e);
  })
  return data;
}

async function isAlreadyPresent(title, floorId){
  var validate = true;
  await roomModel.isRoomTitleAlreadyExist(title, floorId).then( result => {
    return result;
  }).catch(e => {
    console.log(e)
  })
  return validate;
}

//handle to auto generate table title 
async function getArrayOfTableTitle(noOfTable) {
  var tableTitleArray = [];
  const setting = await getTableSetting();
  var totalTable = await countTotalTable();
  if(setting && setting.length <= 0) return null;
  //console.log((setting.length>0) , totalTable ,(totalTable.length<0),'::Boolean values::');
  // if((!setting && setting.length>0) || (!totalTable && totalTable.length>0)) return null;
  var startNumber = setting[0]['startNumber'];
  if((setting && setting.length <= 0) ||(!totalTable && totalTable<0)) return null;
  //console.log(!startNumber , startNumber == null, startNumber,'line 77 helper')
  var prefix = setting[0]['prefix'];
  if(startNumber === null || prefix === null) return null;
  totalTable = Number(totalTable) > 0 ? Number(totalTable) : Number(totalTable);
  var startNumber = Number(startNumber) + Number(totalTable);
  var index = 0;
  for(var i= 0; i < Number(noOfTable); i++){
    var title = "";
    do{
      title = prefix + (Number(startNumber) + Number(index));
      index++;
    }while (!await isTableAlreadyPresent(title));
    tableTitleArray.push(title);
  }

  return tableTitleArray;
}

async function getTableSetting(){
  var data = null;
  await tableSettingModel.findTableSetting().then(result => {
     data = result;
  }).catch(e => {
    console.log(e);
  })
  return data;
}

async function countTotalTable(){
  var data = null;
  await tableModel.countTotalTable().then( result => {
    data = result;
  }).catch(e => {
    console.log(e);
  })
  return data;
}

async function isTableAlreadyPresent(title){
  var validate = true;
  await tableModel.isTableTitleAlreadyExist(title).then( result => {
    return result;
  }).catch(e => {
    console.log(e)
  })
  return validate;
}



module.exports = {apiCallBack, getArrayOfRoomNumber, getArrayOfTableTitle, countTotalRoom};