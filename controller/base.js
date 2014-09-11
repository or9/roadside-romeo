var util = require("util");
var fs = require("fs");
module.exports = Base;

function Base(controllerName) {
	var instanceName = controllerName;
	this.GET = get;
	this.POST = post;
	this.PUT = put;
	this.HEAD = head;
	this.DELETE = del;
	this.getResponseData = function getData(ext) {
		ext = ext || ".json";
		return fs.readFileSync("data/" + instanceName + ext, {encoding: "utf8"});
	};
}

function get(req, res) {
	util.log("GETTING through base controller");
	res.status(200).end();
}

function post(req, res) {
	util.log("POSTing throgh base controller");
	res.status(200).end();
}

function put(req, res) {
	util.log("PUTting through base controller");
	res.status(200).end();
}

function head(req, res) {
	util.log("HEADing via base controller");
	res.status(200).end();
}

function del(req, res) {
	util.log("DELETE'ing via base controller");
	res.status(200).end();
}
