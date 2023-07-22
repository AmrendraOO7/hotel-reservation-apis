const express = require('express');
const router =  express.Router();

const typeOrCategory = require('../controllers/categoryAndType.controller');

//set type or category
router.get('/',typeOrCategory.roomCategoryOrType);

//get type by id
router.get('/id',typeOrCategory.roomCategoryOrTypeById);

router.get('/mailCheck',typeOrCategory.mailCheck);

router.get('/toWords',typeOrCategory.convertToWOrd);

module.exports= router;