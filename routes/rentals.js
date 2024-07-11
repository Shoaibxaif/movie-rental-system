const express = require("express");
const router = express.Router();
const db = require("../db");
const { v4: uuidv4 } = require("uuid");
const moment = require("moment");

// GET route to fetch and display all rentals
router.get("/", (req, res) => {
    db.query("SELECT * FROM Rentals", (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Error fetching rentals" });
        }
        res.render("rentals", { rentals: results, moment: moment });
    });
});

// GET route to render the form to add a new rental
router.get("/add", (req, res) => {
    db.query("SELECT Title FROM Movies", (err, movies) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Error fetching movies" });
        }
        db.query("SELECT Name FROM Customers", (err, customers) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: "Error fetching customers" });
            }
            res.render("addRentals", { movies: movies, customers: customers });
        });
    });
});

// POST route to insert a new rental
router.post("/add", (req, res) => {
    const { name, title, rentalDate, returnDate, duePayment, fullPayment } = req.body;
    const rentalID = uuidv4();
    db.query(
        "INSERT INTO Rentals (RentalID, Title, Name, RentalDate, ReturnDate, DuePayment, FullPayment) VALUES (?, ?, ?, ?, ?, ?, ?)",
        [rentalID, title, name, rentalDate, returnDate, duePayment, fullPayment === 'on'],
        (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: "Error saving rental" });
            }
            console.log("Rental saved successfully");
            res.redirect('/rentals');
        }
    );
});

module.exports = router;
