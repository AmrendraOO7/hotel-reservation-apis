const pkg = require('jsonwebtoken');
const { sign } = pkg;

async function generateJWTToken (userId) {
    return await new Promise((resolve, reject) => {
        if(userId) {
            let jwtSecretKey = process.env.JWT_SECRET_KEY;
            let data = {
                time: Date(),
                userId: userId,
            }
            const token = sign(data, jwtSecretKey);
            if(token) resolve(token);
            else reject('Failed to generate token!');
        } else reject('Invalid user ID.');
    })
}

module.exports = {generateJWTToken};


