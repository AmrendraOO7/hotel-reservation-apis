const express = require('express');
const router =  express.Router();

const bookingMessage = require('../controllers/bookingMessage.controller');


router.get('/allUnread',bookingMessage.getAllMessage);
router.post('/',bookingMessage.saveMessage);
router.put('/',bookingMessage.updateMessage);
router.put('/read',bookingMessage.readMessage);
router.delete('/',bookingMessage.deleteMessage);
router.get('/search',bookingMessage.searchMessage);
router.get('/count',bookingMessage.getCountUnreadMessage);
module.exports = router;