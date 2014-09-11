module.exports = Services;

function Services() {
	require("./base").call(this);
	this.POST = post;

	function post(req, res) {
		console.log("POSTing via services controller");
		res.json(200, responseJson(req));
	}
}
