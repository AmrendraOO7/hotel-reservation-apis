const express = require('express');
const router =  express.Router();
const user = require('../controllers/user.controller');

//save new user
router.post('/', user.saveNewUser);

//update user
router.put('/', user.updateUser);

//find all user
router.get('/', user.findAllUserByRoleId);

//get room list
router.get('/findById', user.findUserById);

//delete room
router.delete('/', user.disableUserById);

//validate username
router.get('/validate', user.checkIfUsernameAlreadyExistORNot);

router.get('/companyProfile', user.getCompanyProfile);

// roleid
//router.get('/roleId',user.getRoleId);

module.exports = router;