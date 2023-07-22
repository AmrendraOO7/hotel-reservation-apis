const tableModel = require('../models/table.model');
const helper = require ('../middleware/helper.js');
const string = require ('../middleware/strings.js');
const { apiCallBack, getArrayOfTableTitle } = helper;
const { SUCCESS_CODE, SUCCESS_MESSAGE, REQUIRED_FIELDS, ERROR_500, INFO_CODE } = string;

//create function for new table
async function createTable(req,res){
    const table = req.body;
    if(!table || Object(table).length === 0) return apiCallBack(res,null,REQUIRED_FIELDS,INFO_CODE);

    if(table.noOftable === null || !table.typeId) return apiCallBack(res,null,REQUIRED_FIELDS,INFO_CODE);

    var tableTitleArray = await helper.getArrayOfTableTitle(table.noOftable);
    if(tableTitleArray === null || tableTitleArray.length <= 0)  return apiCallBack(res, null, "Failed to generate table title. Contact Support team.", INFO_CODE);

    for(var i=0; i < tableTitleArray.length; i++){
        table['title'] = tableTitleArray[i];
        await tableModel.createNewTable(table).then( () => {
        }).catch(e => {
            return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
        })
    }     
    return apiCallBack(res, null, SUCCESS_MESSAGE.save, SUCCESS_CODE);  
}

//upadate table
async function update(req,res){
    var table = req.body;
    if(!table || Object(table).length === 0)  return apiCallBack(res,null,REQUIRED_FIELDS,INFO_CODE);
    if(table.id === null || !table.title || !table.typeId ) return apiCallBack(res,null,REQUIRED_FIELDS,INFO_CODE);
    await tableModel.checkTitleExistanceOnUpdate(table.id,table.title).then(async exist=>{
        if(exist===false){
            await tableModel.updateTable(table).then(()=>{
                return apiCallBack(res,null,SUCCESS_MESSAGE.update,SUCCESS_CODE);
            }).catch(_e => {
                return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
            });
        }else return apiCallBack(res,null,'Table number is already in use',string.INFO_CODE);
    }).catch(e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    });
}

//get table List
async function findAllTable(req,res){
    var type = req.query['type'];
    await tableModel.findAllTables(type).then(result => {
        return apiCallBack(res, result, null, SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    })
}

//get table by id
async function findById(req,res){
    var id = req.query['id'];
    if(id === null) return apiCallBack(res,null,'Sorry but Id not found to featch data.',INFO_CODE);
    await tableModel.findById(id).then(result=>{
        if(result.length>0) return apiCallBack(res,result[0],null,SUCCESS_CODE);
        else return apiCallBack(res, null, null,SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    });
}

//get table by id
async function findByType(req,res){
    var id = req.query['typeId'];
    if(id === null) return apiCallBack(res,null,'Sorry but Id not found to featch data.',INFO_CODE);
    await tableModel.findBytypeId(id).then(result=>{
        if(result.length>0) return apiCallBack(res,result,null,SUCCESS_CODE);
        else return apiCallBack(res, null, null,SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    });
}

//get delete table by id
async function deleteTable(req,res){
    var id = req.query.id;
    if(id === null) return apiCallBack(res,null,'Id not found to featch data.',INFO_CODE);
    await tableModel.deleteTable(id).then(()=>{
        return apiCallBack(res,null,SUCCESS_MESSAGE.delete,SUCCESS_CODE);
    }).catch(_e => {
        return apiCallBack(res,null,ERROR_500.message, ERROR_500.code);
    })
}

module.exports = {createTable, update, findAllTable, findById, deleteTable,findByType};
