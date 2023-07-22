const express = require('express');
const router = express.Router();
const tableSettingController = require('../controllers/table.setting.controller');

//get room setting by id
router.get('/',tableSettingController.findAll);

//update room setting
router.put('/',tableSettingController.update);

module.exports = router;