const express = require('express');
const router =  express.Router();

const tableBill = require('../controllers/tableBilling.controller');

//save content 
router.post('/',tableBill.saveNewBill);

//get search
router.get('/search',tableBill.getBillSearch);

//search account by room id
router.get('/search/account',tableBill.getBillMaster);

//search item list
router.get('/search/items',tableBill.getBillItems);

//check is account open
router.get('/checkAccount',tableBill.getAccount);

//open account
router.post('/openAccount',tableBill.openAccount);

module.exports= router;