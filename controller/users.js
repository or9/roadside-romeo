var util = require("util");
module.exports = Users;

function Users() {
	require("./base").call(this, "users");
	var template = this.getResponseData("hbs");
	var dummyJson = this.getDummyJson();
	var xml2js = this.getXml2js();
	this.generic = generic;
	this.GET = generic;
	this.PUT = generic;
	this.POST = post;
	this.HEAD = head;
	this.DELETE = generic;
	this.registerUser = registerUser;
	this.postForUserInfo = postForUserInfo;

	function post(req, res) {
		console.log("req.params? ", req.params);

	}

	function registerUser(req, res) {
		util.log("Users controller registering user");
	}

	function postForUserInfo(req, res) {
		util.log("Users controller requesting user info");
	}

	function head(req, res) {
		console.log("req.query? ", req.query);
		res.send(200);
	}

	function generic(req, res) {
		util.log("Users Controller single router endpoint");
		var xmlBuilder = null;
		var resMessage = dummyJson.parse(template, {helpers: templateData.helper});
		delete resMessage.password;
		delete resMessage.id;
		delete resMessage.created_at;
		delete resMessage.updated_at;

		console.log("resMessage set to… ", resMessage);
		res.set("Content-Type", req.get("Accept"));
		console.log("and res.Content-Type is: ", res.get("Content-Type"));
		
		if(res.get("Content-Type") === "application/xml") {
			xmlBuilder = new xml2js.Builder();
			/*for(var i = 0; i < resMessage.users.length; i++) {
				resMessage[i] = {};
				for(var key in resMessage.users[i]) {
					resMessage[i][key] = resMessage.users[i][key];
				}
			}*/
			resMessage = xmlBuilder.buildObject(resMessage);
		}
		res.status(200).send(resMessage);
	}
}
