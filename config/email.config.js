const nodemailer = require("nodemailer");
const dotenv = require('dotenv');
const hbs = require('nodemailer-express-handlebars');
const path = require('path');

dotenv.config();

async function mail(data, templateName) {

  // create reusable transporter object using the default SMTP transport
  let transporter = nodemailer.createTransport({
    host: process.env.EMAIL_HOST,
    port: process.env.EMAIL_PORT,
    secure: true, // true for 465, false for other ports
    auth: {
      user: process.env.EMAIL_FROM, // generated ethereal user
      pass: process.env.EMAIL_PASS, // generated ethereal password
    },
  });

  const handlebarOptions = {
    viewEngine: {
      extName: ".handlebars",
      partialsDir: path.resolve('./views'),
      defaultLayout: false,
    },
    viewPath: path.resolve('./views'),
    extName: ".handlebars",
  }
  transporter.use('compile', hbs(handlebarOptions));

  // send mail with defined transport object
  await transporter.sendMail({
    from: `B&B Hotel and Resturant < ${process.env.EMAIL_FROM} >`, // sender address
    to: data.email, // list of receivers
    subject: data.subject, // Subject line
    template: templateName,
    context: data
  }).catch(e => {
    console.log(e, "::e")
  });
}



module.exports = mail;




// const nodemailer = require("nodemailer");
// const dotenv = require('dotenv');

// dotenv.config();

// async function mail(to, sub, message) {
//   // create reusable transporter object using the default SMTP transport
//   let transporter = nodemailer.createTransport({
//     host: process.env.EMAIL_HOST,
//     port: process.env.EMAIL_PORT,
//     secure: true, // true for 465, false for other ports
//     auth: {
//       user: process.env.EMAIL_FROM, // generated ethereal user
//       pass: process.env.EMAIL_PASS, // generated ethereal password
//     },
//   });

//   // send mail with defined transport object
//   await transporter.sendMail({
//     from: `B&B  < ${process.env.EMAIL_FROM} >`, // sender address
//     to: to, // list of receivers
//     subject: sub, // Subject line
//     text: message, // plain text body
//   }).catch(e => {
//     console.log(e, "::e")
//   })
// }

// module.exports = mail;
