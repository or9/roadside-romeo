var util = require("util");
module.exports = Users;

function Users() {
	require("./base").call(this, "users");
	var template = this.getResponseData("hbs");
	var templateData = this.templateData;
	var dummyJson = this.getDummyJson();
	var xml2js = this.getXml2js();
	var goose = this.getDatabase();

	this.generic = generic;
	this.GET = generic;
	this.HEAD = head;
	this.getUser = getUser;
	this.postRegisterUser = registerUser;
	this.postForUserInfo = postForUserInfo;
	this.reset = reset;

	function errHandler(err, res) {
		util.log("Users error: ", err);
		res.status(500).send(err);
	}

	function registerUser(req, res) {
		util.log("Users controller registering user");
		var User = goose.User;
		User.create(getNewUserData(), createResult);

		function createResult(err, result) {
			util.log("response from DB: ", "err: ", err, "result: ", result);
			if(err) return errHandler(err, res);
			result.password = new Buffer(result.email + ":" + result.password).toString('base64');
			res.status(200).send(result).end();
		}

		function getNewUserData() {
			var data = dummyJson.parse(template, {helpers: templateData.helper});
			var newUserData = JSON.parse(data).users[0];
			delete newUserData.id;
			
			for(var key in req.body) {
				if(key !== ("password" || "id")) 
					newUserData[key] = req.body[key];
			}
			newUserData.created_at = new Date();
			newUserData.updated_at = new Date();
			return newUserData;
		}
	}

	function postForUserInfo(req, res) {
		util.log("Users controller requesting user info");
		var User = goose.User;
		var fields = "email password";
		var credentials = req.headers.authorization.split(" ");
		if(credentials.length === 0) {
			response.status(400).send("Missing some stuff");
			return;
		}

		var auth = new Buffer(credentials[1], "base64").toString("ascii");
		User.findOne({ email: req.params.EMAIL }, queryResult);

		function queryResult(err, result) {
			if(err) return errHandler(err);

			if(result && (result.email + ":" + result.password !== auth)) 
				res.status(401).send("Invalid credentials").end(); 

			if(result && result._id) {
				User.findById(result._id, function(err, doc) {
					doc.name = ["Great", "Success!"];
					doc.save(function() {
						res.status(200).send(doc);
					});
				});
			} else {
				res.status(404).send("User does not exist").end();
			}

		}
	}

	function getUser(req, res) {
		var User = goose.User;
		var fields = "";
		
		User.findOne(getQuery(), fields, queryResult);

		function queryResult(err, result) {
			if(err) return errHandler(err);
			if(!result) res.status(404).send("No results");
			else res.status(200).send(result);
		}

		function getQuery() {
			var query = {
				id: req.query.id,
				name: getNameQuery(),
				company: req.query.company,
				age: req.query.age,
				email: req.query.email,
				updated_at: req.query.updated_at,
				created_at: req.query.created_at
			};

			for(var key in query) {
				if(query[key]) {
					delete query[key];
				} else {
					fields += key + " ";
				}
			}
			return query;

			function getNameQuery() {
				var nameQuery = [];
				var i = 0;
				for(var key in req.query) {
					if(key.match(/name/i)) {
						nameQuery[i] = req.query[key];
					}
					i++;
				}
				return nameQuery;
			}
		}
	}

	function reset(req, res) {
		var User = goose.User;
		var query = User.remove({});
		query.exec();
		User.find({}, function(err, result) {
			res.status(200).send(result);
		});
	}

	function head(req, res) {
		res.status(200).end();
	}

	function generic(req, res) {
		util.log("Users Controller generic router endpoint");
		var xmlBuilder = null;
		var data = dummyJson.parse(template, {helpers: templateData.helper});
		var resMessage = JSON.parse(data);

		for(var i = 0; i < resMessage.users.length; i++) {
			delete resMessage.users[i].password;
			delete resMessage.users[i].id;
			delete resMessage.users[i].created_at;
			delete resMessage.users[i].updated_at;
		}

		res.set("Content-Type", req.get("Accept"));
		
		if(res.get("Content-Type") === "application/xml") {
			xmlBuilder = new xml2js.Builder();
			resMessage = xmlBuilder.buildObject(resMessage);
		}

		res.status(200).send(resMessage);

	}
}
