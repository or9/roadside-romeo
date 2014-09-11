module.exports = Home;

function Home() {
	require("./base").call(this);
	this.POST = post;

	function post(req, res) {
		console.log("POSTing via Home controller's route");
	}

}
