var Schema = require("mongoose").Schema;
module.exports = exports = {
	_owner: { type: Schema.Types.ObjectId, ref: "User" },
	name: String,
	city: String,
	service: Schema.Types.Mixed,
	created_at: { type: Date, Default: Date.now() },
	updated_at: { type: Date, Default: Date.now() }
};
