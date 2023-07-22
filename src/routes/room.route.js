const express = require('express');
const router =  express.Router();
const room = require('../controllers/room.controller');
//const {auth} =  require('../middleware/auth.js');

//save room
router.post('/',room.createNewRoom);

//update room
router.put('/',room.updateRoomById);

//get by id
router.get('/',room.getRoomById);

//get room list by floor id
router.get('/list',room.getRoomList);

//get all room list
router.get('/all/list',room.getAllRoomList);

//delete room
router.delete('/',room.deleteRoomById);

//update room status
router.put('/updateStatus',room.updateRoomStatus);

//get distinct room name
router.get('/getDistinct',room.getDistinctRooms);

module.exports = router;