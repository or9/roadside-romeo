var util = require("util");
module.exports = Users;

function Users() {
	require("./base").call(this, "users");
	var template = this.getResponseData();
	this.all = servicesAll;
	this.GET = servicesAll;
	this.POST = servicesAll;
	this.PUT = servicesAll;
	this.HEAD = servicesAll;
	this.DELETE = servicesAll;

	function servicesAll(req, res) {
		util.log("Users Controller single router endpoint");

	}
}
