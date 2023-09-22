const express = require("express");
const router = express.Router();
const Pickup = require("../models/pickup");

router.get("/", async (req, res) => {
    try {
      const userId = req.header("userId");
  
      if (userId) {
        const filter = {
          $or: [{ userAssigned: null }, { userAssigned: userId }],
        };
  
        const activePickups = await Pickup.find(filter);
  
        res.json(activePickups);
      } else {
        const allActivePickups = await Pickup.find({ userAssigned: null });
        
        res.json(allActivePickups);
      }
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Internal Server Error" });
    }
  });
  

router.post("/add", async (req, res) => {
  try {
    const { soldItemId, userAssigned, status } = req.body;

    const newPickup = new Pickup({ soldItemId, userAssigned, status });

    const savedPickup = await newPickup.save();

    res.status(201).json(savedPickup);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

router.put("/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const { userAssigned, status } = req.body;

    const updatedPickup = await Pickup.findByIdAndUpdate(
      id,
      { userAssigned, status },
      { new: true }
    );

    if (!updatedPickup) {
      return res.status(404).json({ message: "Pickup not found" });
    }

    res.json(updatedPickup);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

module.exports = router;
