var Schema = require("mongoose").Schema;
module.exports = exports = {
	_id: { type: Schema.Types.ObjectId, required: true, unique: true },
	name: { type: Array, index: true },
	email: {type: String, index: true, unique: true },
//	company: { type: Schema.Types.ObjectId, ref: "Service" },
  company: String,
	age: { type: Number, index: true },
	created_at: Number,
	updated_at: Date
};
