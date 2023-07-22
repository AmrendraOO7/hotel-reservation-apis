const SUCCESS_CODE = 200;
const INFO_CODE = 100;
const SUCCESS_MESSAGE = {
    save: 'Saved Successfully.',
    update: 'Updated Successfully.',
    delete: 'Delete successfully.',
    user_active: 'User active successfully.',
    User_verified: 'User verified successfully.',
    Mailed_Successfully: "Mailed successfully.",
    noMessage: 'No Booking found'
};
const REQUIRED_FIELDS = 'Please fill all required fileds.';

const ERROR_500 = {
    message: 'Internal Server Error.Contact Support team',
    code: 500
};

const INVALID_PASSWORD = 'Invalid Password!';
const INVALID_USER = 'Invalid User!'

const FAILED_MESSAGE = {
    token: 'Failed to generate token!',
    invalid_mail_id: 'Invalid Email Id!',
    mail_not_register: 'Email not registered!',
    invalid_phone: 'Invalid Phone number!',
    phone_not_register: 'Phone not registered!',
    mail_failed: 'Failed to mail!' ,
    ACCOUNT_NOT_MATCH : "Account doesn't match with this E-mail.Do you want to register new account."
}

//invalid token message
const Invalid_TOKEN = {
    code: 100,
    message: 'Invalid token!'
}

//email && phone already exists message
const UserId_already_exists = {
    mail: 'Mail already exist!',
    phone: 'Phone already exist!',
    idExists:'Id already exist!',
    IdDoesNotExists: 'Id doesnot exist!'
}


// access denied
const Access_denied = {
    code: 403,
    message: 'Access Denied'
}

module.exports = {Access_denied, UserId_already_exists, Invalid_TOKEN, FAILED_MESSAGE, SUCCESS_CODE,
                    INVALID_USER, INVALID_PASSWORD, ERROR_500, REQUIRED_FIELDS, SUCCESS_MESSAGE,INFO_CODE }