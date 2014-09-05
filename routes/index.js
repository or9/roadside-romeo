var express = require('express');
var router = express.Router();
var util = require("util");

/* GET home page. */
router.get('/', function(req, res) {
  res.render('index', { title: 'Express' });
});

router.get('/:HTML.html', renderHTML);
router.get('/:JSON.json', returnJSON);

function renderHTML(req, res) {
	util.log("rendering HTML… ");
}

function returnJSON(req, res) {
	util.log("returning JSON…");
}

module.exports = router;
