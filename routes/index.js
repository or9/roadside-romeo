var express = require('express');
var router = express.Router();
var util = require("util");
var controller = {
	home: require("controller/home"),
	services: require("controller/services"),
	users: require("controller/users")
};

/* GET home page. */
router.get('/', function(req, res) {
	var renderedPageProperties = {};
	for(var key in req.query) {
		renderedPageProperties[key] = req.query[key];
	}

  //res.render('index', { title: 'Express' });
  res.render('index', obj);
});

router.post("/", controller.home.POST);
router.all("/users", controller.users.all);
router.get("/api/services", returnServices);
router.post("/api/services", returnServices);
router.post("/api/services", returnServices);

function renderHTML(req, res) {
	util.log("rendering HTML… ");
}

function returnJSON(req, res) {
	util.log("returning JSON…");
}

module.exports = router;
