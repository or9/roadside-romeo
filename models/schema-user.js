var Schema = require("mongoose").Schema;
var UserSchema = new Schema(schema());
module.exports = exports = UserSchema;

function schema() {
  return {
    id: { type: Schema.Types.ObjectId, unique: true },
    name: { type: Array, index: true },
    email: {type: String, index: true, unique: true },
    password: String,
    company: String,
    age: { type: Number, index: true },
    created_at: Date,
    updated_at: Date
  };
}
