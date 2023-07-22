const express = require('express');

const router = express.Router();

const foodMenuController = require('../controllers/food.menu.controller');

//get all food menu
router.get('/all', foodMenuController.getFoodMenuList);

//search list
router.get('/search', foodMenuController.getFoodMenuListSearch);

// get food menu by ID
router.get('/',foodMenuController.getFoodMenuById);

// create new food menu
router.post('/', foodMenuController.createNewFoodMenu);

// update food menu
router.put('/', foodMenuController.updateFoodMenu);

// delete food menu
router.delete('/',foodMenuController.deleteFoodMenu);

module.exports = router;