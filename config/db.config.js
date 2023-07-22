const mysql = require('mysql');
const dotenv = require('dotenv');
var ip = require('ip');
const port = process.env.PORT;
dotenv.config();

const console = require('Console');

//create mysql connection
const dbConn = mysql.createConnection({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
  port: process.env.MYSQL_PORT,
  multipleStatements: true
})

dbConn.connect(function(error){
  if(error) console.log(error, "Error while connecting to database.Please check the credentials of database.")
  else {
    console.debug(`System started on local\n host: http://localhost:${port}/ \n server: http://${ip.address()}:${port}/`);
    console.log('Database connected successfully.')};
})

// dbConn.connect(function(err){
//   if(err) console.error(err,"\nError in database connection.");
//   else {
//       console.debug(`System started on local\n host: http://localhost:${port}/ \n server: http://${ip.address()}:${port}/`);
//       console.success("Database connection is successfull.");

//      //OLD system // //TRACE IP OF THE SYSTEM
//       // require('dns').lookup(require('os').hostname(), function (err, ipAddress) {
//       //     if(err) console.error('Error in getting system ip.');
//       //     //importing console after install we can also use other codes bellow
//       //     //.log() .debug() .error() .warn() .stress() .success()
//       //     //console.log(ip.address());
//       //     console.debug(`System started on local\n host: http://localhost:${port}/ \n server: http://${ipAddress}:${port}/`);
//       //     console.success("Database connection is successfull.");
//       // });
//   }
// });

module.exports = dbConn;