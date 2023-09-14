const express = require("express");
const router = express.Router();
const ewasteFacility = require("../models/ewasteFacility");

// Create a new ewaste facility
router.post("/", async (req, res) => {
  try {

    const { name, coordinates, description, type, location, reviews } = req.body;

    const newFacility = await ewasteFacility.create(req.body);
    res.status(201).json({ id: newFacility._id });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Update an ewaste facility by ID
router.put("/:id", async (req, res) => {
  try {
    const updatedFacility = await ewasteFacility.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    if (!updatedFacility) {
      return res.status(404).json({ error: "Facility not found" });
    }
    res.json({ id: updatedFacility._id, message: "Ewaste facility updated successfully"}) 
} catch (err) {
    res.status(500).json({ error: err.message });
  }
});
// Retrieve all ewaste facilities
router.get("/", async (req, res) => {
  try {
    const facilities = await ewasteFacility.find();
    res.json(facilities);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Retrieve a specific ewaste facility by ID
router.get("/:id", async (req, res) => {
  try {
    const facility = await ewasteFacility.findById(req.params.id);
    if (!facility) {
      return res.status(404).json({ error: "Facility not found" });
    }
    res.json(facility);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Delete an ewaste facility by ID
router.delete("/:id", async (req, res) => {
  try {
    const deletedFacility = await ewasteFacility.findByIdAndRemove(req.params.id);
    if (!deletedFacility) {
      return res.status(404).json({ error: "Facility not found" });
    }
    res.json({ message: "Ewaste facility deleted successfully" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;

module.exports = router;
