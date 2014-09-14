var express = require('express');
var router = express.Router();
var util = require("util");
var users = new (require("./controller/users"))();

/* GET home page. */
router.get('/', function(req, res) {
	var renderedPageProperties = {};
	util.log("getting response from req.query: ", req.query);
	for(var key in req.query) {
		renderedPageProperties[key] = req.query[key];
	}
  res.render('index', renderedPageProperties);
});

router.all("/users", users.generic);
router.get("/user", users.getUser);
router.post("/register", users.postRegisterUser);
router.post("/user/:EMAIL", users.postForUserInfo);

module.exports = router;
