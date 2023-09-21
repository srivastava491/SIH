const mongoose = require("mongoose");

const soldItemSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  soldOn: {
    type: Date,
    default: Date.now,
  },
  credit: {
    type: Number,
    required: true,
  },
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User", // Reference the User model
    required: true,
  },
});

const SoldItem = mongoose.model("SoldItem", soldItemSchema);

module.exports = SoldItem;
