const mongoose = require("mongoose");

const ewasteFacilitySchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  coordinates: {
    type: {
      type: String,
      enum: ["Point"],
      required: true,
    },
    coordinates: {
      type: [Number],
      required: true,
    },
  },
  description: {
    type: String,
    required: true,
  },
  type: {
    type: String,
    required: true,
  },
  location: {
    type: String,
    required: true,
  },
  reviews: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Review",
    },
  ],
});

ewasteFacilitySchema.index({ coordinates: "2dsphere" });

const ewasteFacility = mongoose.model("ewasteFacility", ewasteFacilitySchema);

module.exports = ewasteFacility;
