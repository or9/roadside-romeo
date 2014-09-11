module.exports = Users;

function Users() {
	require("./base").call(this);
	this.all = servicesAll;
	this.GET = servicesAll;
	this.POST = servicesAll;
	this.PUT = servicesAll;
	this.HEAD = servicesAll;
	this.DELETE = servicesAll;

	function servicesAll(req, res) {
		console.log("all Users' services routed through here");
	}
}
