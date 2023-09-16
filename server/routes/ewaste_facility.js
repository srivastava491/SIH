const express = require("express");
const router = express.Router();
const ewasteFacility = require("../models/ewasteFacility");

// Create a new ewaste facility
router.post("/signup", async (req, res) => {
  try {

    const { name, coordinates, description, type, location, reviews } = req.body;

    const newFacility = await ewasteFacility.create(req.body);
    res.status(201).json({ id: newFacility._id });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

router.post('/api/signin', async (req, res) => {
  try {
    const { email, password } = req.body;

    // Find the user by email
    const user = await User.findOne({ email });

    // If the user doesn't exist, return an error
    if (!user) {
      return res.status(400).json({ msg: 'User with this email does not exist!' });
    }

    // Compare the provided password with the stored hashed password
    const isMatch = await bcrypt.compare(password, user.password);

    // If the passwords don't match, return an error
    if (!isMatch) {
      return res.status(400).json({ msg: 'Incorrect password.' });
    }

    // Create a JWT token with the user's ID
    const token = jwt.sign({ id: user._id }, 'your-secret-key');

    // Return the token and user data
    res.json({ token, user });
  } catch (e) {
    res.status(500).json({ error: e.message });
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
