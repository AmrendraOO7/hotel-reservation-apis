const express = require('express');
const router =  express.Router();

const roomNumberGeneration = require('../controllers/roomNumberGeneration.controller');


router.get('/',roomNumberGeneration.numberGeneration);

module.exports = router;