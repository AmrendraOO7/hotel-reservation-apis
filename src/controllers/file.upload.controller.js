const helper = require ('../middleware/helper.js');
const string = require ('../middleware/strings.js');
const { apiCallBack } = helper;
const { SUCCESS_CODE } = string;
const fileUpload = require ('../middleware/file.handler.js');

var uploadFiles = async (req, res) => {
  fileUpload(req, res, (err) => {
    if(err) {
      if (err.name === 'MulterError')  return apiCallBack(res, null, err.message, 201);
      else  return apiCallBack(res, null, 'Something went wrong while uploading image!', 201);
    } else {
      let items = req.files;
      var x = []
      if(items && items.files && items.files.length > 0) {
        for(var i =0 ; i < items.files.length; i++) {
          x.push(items.files[i].filename);
        }
      }
      let body = {
        file: items && items.file && items.file.length > 0 ? items.file[0].filename : null,
        files: x,
      };
       return apiCallBack(res, body, null, SUCCESS_CODE);
    }
  });
};

module.exports = { uploadFiles };