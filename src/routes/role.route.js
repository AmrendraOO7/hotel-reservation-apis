const express = require('express');
const router =  express.Router();
const role = require('../controllers/role.controller');

//save new Role
router.post('/', role.saveNewRole);

//update Role
router.put('/', role.updateRole);

//find all Role
router.get('/', role.getAllRole);

//get room list
router.get('/findById', role.findRoleById);

//delete room
router.delete('/', role.disableRoleById);

//validate Rolename
router.get('/validate', role.checkIfRolenameAlreadyExistORNot);


module.exports = router;