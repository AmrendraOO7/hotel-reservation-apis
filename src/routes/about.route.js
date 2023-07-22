const express = require('express');
const router =  express.Router();

const about = require('../controllers/about.controller');

//update content
router.put('/',about.update);

router.get('/', about.getContent);

module.exports= router;