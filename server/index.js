const express = require("express");
const mongoose = require("mongoose");

// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const ewasteFacilityRouter = require("./routes/ewaste_facility");
const soldItemRouter = require("./routes/solditem");
const pickupRouter = require("./routes/pickup");

// INIT
const PORT = process.env.PORT || 3000;
const app = express();
const DB = "mongodb+srv://him-at:him-at@cluster0.4yqsazk.mongodb.net/?retryWrites=true&w=majority";

// middleware
app.use(express.json());
app.use(authRouter);
app.use("/api/ewaste_facilities", ewasteFacilityRouter);
app.use("/api/solditems", soldItemRouter);
app.use("/api/pickups", pickupRouter);

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
