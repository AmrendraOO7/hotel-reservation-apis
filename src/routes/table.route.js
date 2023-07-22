const express = require('express');
const router =  express.Router();
const table = require('../controllers/table.controller');
//const {auth} =  require('../middleware/auth.js');

//save table
router.post('/',table.createTable);

//update table
router.put('/',table.update);

//find all
router.get('/',table.findAllTable);

//find by id
router.get('/id',table.findById);

//find by type id
router.get('/typeId',table.findByType);

//delete table
router.delete('/', table.deleteTable);

module.exports = router;