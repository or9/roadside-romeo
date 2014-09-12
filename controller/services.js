var util = require("util");
module.exports = Services;

function Services() {
	require("./base").call(this, "services");
	var template = this.getResponseData("hbs");
	var dummyJson = this.getDummyJson();
	this.POST = post;

	function head(req, res) {
		util.log("HEAD'ing via services controller");
		res.status(200).end();
	}

	function post(req, res) {
		util.log("POSTing via services controller");
		res.set("Content-Type", "application/json");
		res.send(dummyJson.parse(template));
	}
}
