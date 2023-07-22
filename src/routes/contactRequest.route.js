const express = require('express');
const router =  express.Router();

const contactRequest = require('../controllers/contactRequest.controller');

//set type or category
router.post('/',contactRequest.saveRequest);

//get type by id
router.put('/',contactRequest.markRead);

router.delete('/delete',contactRequest.markDelete);

router.get('/search',contactRequest.getSearch);

router.get('/',contactRequest.getAll);

module.exports= router



//saveRequest, markRead, markDelete, getSearch