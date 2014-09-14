var Schema = require("mongoose").Schema;
module.exports = exports = {
	_id: { type: Schema.Types.ObjectId, required: true, unique: true },
	name: Array,
	email: String,
	company: { type: Schema.Types.ObjectId, ref: "Service" },
	age: Number,
	created_at: Number,
	updated_at: Date
};
