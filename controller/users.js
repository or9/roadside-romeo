var util = require("util");
module.exports = Users;

function Users() {
	require("./base").call(this, "users");
	var template = this.getResponseData("hbs");
	var templateData = this.templateData;
	var dummyJson = this.getDummyJson();
	var xml2js = this.getXml2js();
	this.generic = generic;
	this.GET = generic;
	this.HEAD = head;
	this.postRegisterUser = registerUser;
	this.postForUserInfo = postForUserInfo;

	function registerUser(req, res) {
		util.log("Users controller registering user");
	}

	function postForUserInfo(req, res) {
		util.log("Users controller requesting user info");
	}

	function getUser(req, res) {
	}

	function head(req, res) {
		console.log("req.query? ", req.query);
		res.status(200).end();
	}

	function generic(req, res) {
		util.log("Users Controller single router endpoint");
		var xmlBuilder = null;
		var data = dummyJson.parse(template, {helpers: templateData.helper});
		var resMessage = JSON.parse(data);

		for(var i = 0; i < resMessage.users.length; i++) {
			delete resMessage.users[i].password;
			delete resMessage.users[i].id;
			delete resMessage.users[i].created_at;
			delete resMessage.users[i].updated_at;
		}

		res.set("Content-Type", req.get("Accept"));
		
		if(res.get("Content-Type") === "application/xml") {
			xmlBuilder = new xml2js.Builder();
			resMessage = xmlBuilder.buildObject(resMessage);
		}

		res.status(200).send(resMessage);

	}
}
