const bCrypt = require('bcrypt');
const saltRounds = 5;

async function bcryptPassword(userPassword) {
    return await new Promise((resolve, reject) => {
        bCrypt.hash(userPassword, saltRounds, function (err, hash) {
            if (err) reject(err);
            else resolve(hash);
        });
    })
}

async function checkUser(password, dbpassword) {
    return await bCrypt.compare(password, dbpassword);
}

module.exports = {bcryptPassword, checkUser};
