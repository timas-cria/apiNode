const db = require('../db')

module.exports = {
    getUsers: () => {
        return new Promise((accepted, rejected) => {
            db.query('select * from users', (error, results) => {
                if (error) {rejected(error); return;}
                accepted(results);
            })
        });
    }
};