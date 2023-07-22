const express = require('express');
const router =  express.Router();

const booking = require('../controllers/booking.controller');

router.get("/roomsAvailability",booking.availableRooms);

router.get("/roomsStatus",booking.roomsStatus);

router.get("/roomBillingDetail",booking.roomDetails);

router.post("/", booking.requestForBooking);

router.put("/", booking.updateBookingStatus);

router.put("/All", booking.updateBookingStatusByMobile);

router.get("/", booking.findByBookingCode);

router.put("/checkIn", booking.checkIn);

router.put("/checkOut", booking.checkOut);

router.put('/cancelled',booking.cancelled)

router.put('/search', booking.searchForRoomAvailability);

router.get('/findAll', booking.findAllAvailableRooms);

router.get('/findAll/status', booking.getAllRoomByStatus);

router.get('/all',booking.getAllRooms);

router.get('/bookingCode',booking.getAllRoomByBookingCode);

router.put("/cancel", booking.updateBookingStatusFromdate);

router.get("/user/history",booking.getAllUserHistoryByMobile);

router.put("/confirmAll",booking.updateBookingcodeByMobile);

router.get("/availableRooms",booking.getAvailableRooms);


module.exports = router;