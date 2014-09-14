module.exports = exports = Database;

function Database(options) {
	console.log("instantiating goose");
	"use strict";
	options = options || {};
	var mongoose = require("mongoose");
	var util = require("util");
	var Schema = mongoose.Schema;
	mongoose.connect(options.connect || "mongodb://localhost:17017/db");
	var db = mongoose.connection;
	db.on("error", console.error.bind(console, "DB connection error: "));
	db.once("open", function() {
		var schema = {
			user: require("./schema-user"),
			service: require("./schema-service")
		};

		this.update = update;
		this.find = find;
		this.findById = findById;
		this.remove = remove;
		this.removeAll = removeAll.bind(null, true);
		this.save = save;
		this.create = create;
		this.findByIdAndUpdate = findByIdAndUpdate;
		this.findById = findById;
		
		this.model = {
			User: function() {
				return mongoose.model("User", schema.user);
			},
			service: function() {
				return mongoose.model("Service", schema.service);	
			}
		};	
	}.bind(this));
}

function errHandler(err) {
	throw err;
}

function errCallback(err) {
	if(err) return errHandler(err);
}

function save(model) {
		model.save(errCallback);
}

function create(model, properties) {
	model.create(properties, errCallback);
}

function update(model, updateByObject) {
	var id = updateByObject.id;
	delete updateByObject.id;
	model.update({ _id: id }, { $set: updateByObject }, errCallback);
}

function findByIdAndUpdate(model, id, updateByObject) {
	model.update(id, { $set: updateByObject }, function(err, instance) {
		if(err) return errHandler(err);
		return instance;
	});
}

function find(model, byProperty) {
	model.find(byProperty, callback);
	if(err) return errHandler(err);
}

function findById(model, id) {
	model.findById(id, function(err, instance) {
		if(err) return errHandler(err);
		instance.save(errHandler);
		return instance;
	});
}

function removeAll(model) {
	var query = model.find({ _id: /\d/i });
	query.exec(function(err, docs) {
		
	});
}

function remove(model, byProperty) {
	model.remove(byProperty, errHandler);
}
