var util = require("util");
module.exports = Services;

function Services() {
	require("./base").call(this, "services");
	var template = this.getResponseData("hbs");
	var dummyJson = this.getDummyJson();
	var templateData = this.templateData;
	var goose = this.getDatabase();
	this.POST = post;
	this.GET = get;

	function head(req, res) {
		util.log("HEAD'ing via services controller");
		res.status(200).end();
	}

	function get(req, res) {
		util.log("GETting via services controller");
		var xmlBuilder = null, xml = null;
		var resMessage = dummyJson.parse(template, {helpers: templateData.helper});
		res.set("Content-Type", req.get("Accept"));
		if(res.get("Content-Type") === "application/xml") {
			xmlBuilder = new xml2js.Builder();
			resMessage = xmlBuilder.buildObject(resMessage);
		}

		res.status(200).send(resMessage);
	}

	function post(req, res) {
		util.log("POSTing via services controller");
		res.status(200).send(dummyJson.parse(template, {helpers: templateData.helper}));
	}
}
