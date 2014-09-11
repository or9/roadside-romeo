var util = require("util");
module.exports = Home;

function Home() {
	require("./base").call(this, "home");
	this.POST = post;

	function post(req, res) {
		util.log("POSTing via Home controller's route");
		
	}

}
