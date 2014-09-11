var express = require('express');
var router = express.Router();
var util = require("util");
var controller = {
	home: new (require("./controller/home"))(),
	services: new (require("./controller/services"))(),
	users: new (require("./controller/users"))()
};
console.log("controller: ", controller);

/* GET home page. */
router.get('/', function(req, res) {
	var renderedPageProperties = {};
	util.log("getting response from req.query: ", req.query);
	for(var key in req.query) {
		renderedPageProperties[key] = req.query[key];
	}

  //res.render('index', { title: 'Express' });
  res.render('index', renderedPageProperties);
});

router.put("/", controller.home.POST);
router.all("/users", controller.users.all);
router.get("/users", controller.services.GET);
router.post("/services", controller.services.POST);
router.head("/services", controller.services.HEAD);

module.exports = router;
