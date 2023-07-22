const express = require('express');
const router =  express.Router();

const roomBill = require('../controllers/roomBill.controller');

//save content
router.post('/',roomBill.saveNewBill);

//get search
router.get('/search',roomBill.getBillSearch);

//search account by room id
router.get('/search/account',roomBill.getBillMaster);

//search item list
router.get('/search/items',roomBill.getBillItems);

//check is account open
router.get('/checkAccount',roomBill.getAccount);

//open account
router.post('/openAccount',roomBill.openAccount);
 
module.exports= router;