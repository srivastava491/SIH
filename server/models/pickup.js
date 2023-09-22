const mongoose = require("mongoose");

const pickupSchema = new mongoose.Schema({
  soldItemId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "SoldItem",
    required: true,
  },
  userAssigned: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
  },
  status: String,
});

const Pickup = mongoose.model("Pickup", pickupSchema);

module.exports = Pickup;
