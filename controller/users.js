var util = require("util");
module.exports = Users;

function Users() {
	require("./base").call(this, "users");
	var template = this.getResponseData("hbs");
	var dummyJson = this.getDummyJson();
	var xml2js = this.getXml2js();
	this.all = servicesAll;
	this.GET = servicesAll;
	this.POST = servicesAll;
	this.PUT = servicesAll;
	this.HEAD = servicesAll;
	this.DELETE = servicesAll;

	function servicesAll(req, res) {
		var xmlBuilder = null;
		var resMessage = dummyJson.parse(template);
		util.log("Users Controller single router endpoint");
		res.set("Content-Type", req.get("Accept"));
		if(res.get("Content-Type") === "application/xml") {
			xmlBuilder = new xml2js.Builder();
			for(var i = 0; i < resMessage.users.length; i++) {
				resMessage[i] = {};
				for(var key in resMessage.users[i]) {
					resMessage[i][key] = resMessage.users[i][key];
				}
			}
			resMessage = xmlBuilder.buildObject(resMessage);
		}
		res.status(200).send(resMessage);
	}
}
