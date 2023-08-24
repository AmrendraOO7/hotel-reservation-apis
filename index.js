const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');

const bodyParser = require('body-parser');
const { json, urlencoded } = bodyParser;

//create express app
var app = express();

dotenv.config();

//
app.use(cors({
    origin: '*',
    methods: ['GET','POST','DELETE','UPDATE','PUT','PATCH']
}));

//defining root route
app.get('/', (_req, res) =>{
    res.send("API connected successfully.");
})

//setup server port.
const PORT= process.env.PORT || 3000;

//listening to the port.
app.listen(PORT, ()=> {
    console.log(`Listening to port: ${PORT}`)
});

//parse request data content type application/x-www-form-urlencoded
app.use(urlencoded({extended: false}));

//parse request data content type application/json
app.use(json());

//handle here entry point of each module

//import user module route
const role = require('./src/routes/role.route');
app.use('/role', role);

//import user module route
const user = require('./src/routes/user.route');
app.use('/user', user);

//import login module route
const login = require('./src/routes/login.route');
app.use('/login', login);

//about content
const about = require('./src/routes/about.route');
app.use('/about', about);

//import food menu
const foodMenu = require('./src/routes/food.menu.route');

//assigned variable to the route link
app.use('/foodMenu',foodMenu);

//import gallery
const gallery = require('./src/routes/gallery.route');

//assign variable to the route link
app.use('/gallery',gallery);

//import type category
const typeOrCategory = require('./src/routes/categoryAndType.route');

//assigned variable to the route
app.use('/type/category',typeOrCategory)

//import room number generation
const roomNumberGenertion = require('./src/routes/roomNumberGeneration.route');

//assigned room setting value
app.use('/roomNumber', roomNumberGenertion);

//room creation
const room = require('./src/routes/room.route');
app.use('/room',room);

//room setting routing
const roomSetting = require('./src/routes/room.setting.route');
app.use('/room/setting', roomSetting);

//table creation
const tableRoute = require('./src/routes/table.route');
app.use('/table', tableRoute);

//table setting routing
const tableSetting = require('./src/routes/table.setting.route');
app.use('/table/setting', tableSetting);

//booking
const bookingRoute = require('./src/routes/booking.route');
app.use("/booking", bookingRoute);
// table booking
const tableBookingRoute = require('./src/routes/tableBooking.route');
app.use("/tableBooking", tableBookingRoute);

//booking
const bookingMessage = require('./src/routes/bookingMessage.route');
app.use("/booking/message", bookingMessage);

//booking table request
const tableBookingMessage = require('./src/routes/tableBookingMessage.route');
app.use("/tableBooking/message", tableBookingMessage);

//billing room request
const roomBill = require('./src/routes/roomBill.route');
app.use("/roomBill", roomBill);

//billing table request
const tableBill = require('./src/routes/tableBilling.route');
app.use("/tableBill", tableBill);

//contact request
const contact = require('./src/routes/contactRequest.route');
app.use("/contact", contact);

// upload image
app.use(express.static('src')); 
app.use('/images', express.static('images'));
const fileUpload = require('./src/routes/file.upload.route.js')
app.use('/api/upload', fileUpload);