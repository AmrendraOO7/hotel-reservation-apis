const express = require('express');
const router =  express.Router();
const login = require('../controllers/login.controller');

//login customer
router.post('/customer', login.loginCustomer);

//login admin
router.post('/admin', login.adminLogin);

module.exports = router;