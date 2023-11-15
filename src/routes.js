const express = require('express');
const router = express.Router();
// const adminRouter = express.Router();

const UserController = require('./controllers/UserController');

// adminRouter.use('/admin', adminRouter);
router.get('/admin/users', UserController.getUsers);

module.exports = router;