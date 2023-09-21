const express = require("express");
const router = express.Router();
const SoldItem = require("../models/solditem");

router.get("/:userId", async (req, res) => {
  try {
    const userId = req.params.userId;
    
    const soldItems = await SoldItem.find({ userId });
    res.json(soldItems);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

router.post("/add", async (req, res) => {
  try {
    const { name, credit, userId } = req.body;
    
    const newSoldItem = new SoldItem({ name, credit, userId });
    
    await newSoldItem.save();
    
    res.status(201).json(newSoldItem);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

module.exports = router;
