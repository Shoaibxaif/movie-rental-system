const express = require("express");
const router = express.Router();
const db = require("../db");
const { v4: uuidv4 } = require("uuid");
const moment = require("moment");

// GET route to fetch and display all customers
router.get("/", (req, res) => {
    db.query("SELECT * FROM Customers", (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Error fetching customers" });
        }
        res.render("customers", { customers: results, moment: moment });
    });
});

// POST route to insert a new customer
router.post("/", (req, res) => {
    const { Name, Email, PhoneNumber, Address, MembershipDate } = req.body;
    const customerID = uuidv4();
    db.query(
        "INSERT INTO Customers (CustomerID, Name, Email, PhoneNumber, Address, MembershipDate) VALUES (?, ?, ?, ?, ?, ?)",
        [customerID, Name, Email, PhoneNumber, Address, MembershipDate],
        (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: "Error saving customer" });
            }
            res.status(200).json({ message: "Customer saved successfully" });
        }
    );
});

module.exports = router;
