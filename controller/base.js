module.exports = Base;

function Base() {
	this.GET = get;
	this.POST = post;
	this.PUT = put;
	this.HEAD = head;
	this.DELETE = del;
}

function get(req, res) {
	console.log("GETTING through base controller");
	res.send(200);
}

function post(req, res) {
	console.log("POSTing throgh base controller");
	res.send(200);
}

function put(req, res) {
	console.log("PUTting through base controller");
	res.send(200);
}

function head(req, res) {
	console.log("HEADing via base controller");
	res.send(200);
}

function del(req, res) {
	console.log("DELETE'ing via base controller");
	res.send(200);
}
