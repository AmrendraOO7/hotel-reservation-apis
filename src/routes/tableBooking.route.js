const express = require('express');
const router =  express.Router();

const tableBooking = require('../controllers/tableBooking.controller');

router.post("/", tableBooking.requestForTableBooking);

router.get('/all',tableBooking.getAllBookingList);

router.get("/availableTables",tableBooking.getAvailableTables);

router.put("/checkIn", tableBooking.checkInTable);

router.put("/checkOut", tableBooking.tableCheckOut);

router.put('/cancelled',tableBooking.cancelled)

//need to create all the functions in the table booking  as created in room booking

module.exports = router;