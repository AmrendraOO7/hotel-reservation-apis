const multer = require('multer');
const path = require('path');
    
var storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, "images"),
  filename: (req, file, cb) => {
    cb(null, new Date().getTime() + path.extname(file.originalname));
  }
});

var upload = multer({ 
  storage: storage,
  limits: 50 * 1024 * 1024,
  fileFilter: (req, file, cb) => {
    var filetypes = /jpeg|jpg|png/;
    var mimetype = filetypes.test(file.mimetype);
    if (mimetype) return cb(null, true);  
    cb("Error: File upload only supports the " + "following filetypes - " + filetypes);
  } 
});

var fileUpload = upload.fields([{ name: 'file', maxCount: 1 }, { name: 'files', maxCount: 10 }]);
module.exports = fileUpload;