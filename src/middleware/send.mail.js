const token = require('./jwt.js');
const string = require('../middleware/strings.js');
const mail = require('../../config/email.config.js');
const helper =  require('../middleware/helper.js');
const dotenv = require('dotenv');
const { apiCallBack } = helper;

dotenv.config();

//booking request mail us mail
const requestBookingMail = async (toMail,fullName,userEmail,mobile,arrivalDate,departureDate,numberOfRooms,roomCategory,roomType,numberOfAdults,NumberOfChildrens) =>{
    return await new Promise((resolve,reject)=>{
        if(fullName && userEmail && mobile && arrivalDate){
            var data = {
                subject:`Booking request from ${fullName}`,
                email: toMail,
                fullName: fullName,
                userEmail:userEmail,
                mobile:mobile,
                arrivalDate:arrivalDate,
                departureDate:departureDate,
                numberOfRooms:numberOfRooms,
                roomCategory:roomCategory,
                roomType:roomType,
                numberOfAdults:numberOfAdults,
                NumberOfChildrens:NumberOfChildrens
            }
            mail(data,'booking').then(() => {
                resolve(`Booking request successfully sent to your admin`);
            }).catch(_e => {
                reject(string.FAILED_MESSAGE.mail_failed);
            });

        }else reject(string.REQUIRED_FIELDS);
    })
}



module.exports = {requestBookingMail};