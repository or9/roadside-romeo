var express = require('express');
var router = express.Router();
var util = require("util");

/* GET users listing. */
router.get('/', function(req, res) {
  res.send('respond with a resource');
});

router.get('/users', getUsers);
router.post('/login', loginUser);
router.put('/users', configUsersResponse);
router.head('/users', checkUser);
router.post('/:USER', updateUser);

function getUsers(req, res) {
	util.log("getUser");
}

function loginUser(req, res) {
	util.log("loginUser");
}

function configUsersResponse(req, res) {
	util.log("configUserResponse");
}

function checkUser(req, res) {
	util.log("checkUser");
}

function updateUser(req, res) {
	util.log("updateUser");
}

module.exports = router;
