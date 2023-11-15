const UserService = require('../services/UserService');

module.exports = {
    getUsers : async (req, res) => {
        let json = {error:'', result:[]};

        let users = await UserService.getUsers();

        for(let index in users){
            json.result.push({
                id: users[index].id,
                name: users[index].name,
                email: users[index].email,
                password: users[index].password,
                photo: users[index].photo,
                biography: users[index].biography
            });
        }
        res.json(json);
    }
}