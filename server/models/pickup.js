const mongoose = require("mongoose");

const pickupSchema = new mongoose.Schema({
  soldItemId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "SoldItem", // Reference the SoldItem model
    required: true,
  },
  userAssigned: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User", // Reference the User model (if assigning to a user)
  },
  status: String,
});

const Pickup = mongoose.model("Pickup", pickupSchema);

module.exports = Pickup;
