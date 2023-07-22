const express = require('express');
const router = express.Router();
const roomSettingController = require('../controllers/room.setting.controller');

//get all room setting
router.get('/', roomSettingController.findAllRoomSettings);

//get room setting by id
router.get('/floorId',roomSettingController.findRoomSettingByFloorId);

//update room setting
router.put('/',roomSettingController.updateRoomSetting);

module.exports = router;