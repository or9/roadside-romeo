var util = require("util");
var fs = require("fs");
var dummyJson = require("dummy-json");
var xml2js = require("xml2js");
var goose = new (require("../models/database"))();
module.exports = Base;

function Base(controllerName) {
	var instanceName = controllerName;
	this.GET = get;
	this.POST = post;
	this.PUT = put;
	this.HEAD = head;
	this.DELETE = del;
	
	this.getDatabase = function() {
		return goose;
	};

	this.getResponseData = function getData(ext) {
		ext = ext || "json";
		return fs.readFileSync("data_templates/" + instanceName + "." + ext, {encoding: "utf8"});
	};

	this.getDummyJson = function getDummyJson() {
		return dummyJson;
	};

	this.getXml2js = function getXml2js() {
		return xml2js;
	};

	this.templateData = {
		helper: {
			city: function(options) {
				var cities = ["Mordor", "Detroit", "Anchorage", "Outer Haven", "Midgar", "Zanzabarland", "Bear Lake", "Atlantis", "Columbia", "Rapture", "Shadow Moses", "Fox Archipelago"];
				var random = Math.random();
				return cities[Math.floor(random *= cities.length)];
			},
			password: function(options) {
				return (Math.random() + 1).toString(36).substring(5, 14);
			},
			created_at: function(options) {
				return new Date();
			},
			updated_at: function(options) {
				return this.created_at(options);
			}
		}
	};
}

function get(req, res) {
	util.log("GETTING through base controller");
	res.set("Content-Type", req.get("Accept"));
	res.status(200).send("OK").end();
}

function post(req, res) {
	util.log("POSTing throgh base controller");
	res.set("Content-Type", req.get("Accept"));
	res.status(200).send("OK").end();
}

function put(req, res) {
	util.log("PUTting through base controller");
	res.set("Content-Type", req.get("Accept"));
	res.status(200).send("OK").end();
}

function head(req, res) {
	util.log("HEADing via base controller");
	res.status(200).send("OK").end();
}

function del(req, res) {
	util.log("DELETE'ing via base controller");
	res.status(200).send("OK").end();
}
