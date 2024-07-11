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


// GET route to render the edit form for a specific rental
router.get("/edit/:id", (req, res) => {
    const { id } = req.params;
    
    // Fetch rental details by RentalID
    db.query("SELECT * FROM Rentals WHERE RentalID = ?", [id], (err, rentalResults) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Error fetching rental details" });
        }
        
        if (rentalResults.length === 0) {
            return res.status(404).json({ message: "Rental not found" });
        }

        // Fetch all movies
        db.query("SELECT Title FROM Movies", (err, movies) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: "Error fetching movies" });
            }

            // Fetch all customers
            db.query("SELECT Name FROM Customers", (err, customers) => {
                if (err) {
                    console.error(err);
                    return res.status(500).json({ message: "Error fetching customers" });
                }

                // Render the editRental.ejs template with data
                res.render("editRental", { rental: rentalResults[0], movies: movies, customers: customers, moment: moment });
            });
        });
    });
});

// POST route to update a specific rental
router.post("/edit/:id", (req, res) => {
    const { id } = req.params;
    const { name, title, rentalDate, returnDate, duePayment, fullPayment } = req.body;
    
    // Perform update query on Rentals table using RentalID
    db.query(
        "UPDATE Rentals SET Title = ?, Name = ?, RentalDate = ?, ReturnDate = ?, DuePayment = ?, FullPayment = ? WHERE RentalID = ?",
        [title, name, rentalDate, returnDate, duePayment, fullPayment === 'on', id],
        (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: "Error updating rental" });
            }
            res.redirect('/rentals'); 
        }
    );
});


// POST route to delete a specific rental
router.get("/delete/:id", (req, res) => {
    const { id } = req.params;
    db.query("DELETE FROM Rentals WHERE RentalID = ?", [id], (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Error deleting rental" });
        }
        return res.send('<script>alert("Rental deleted successfully"); window.location="/rentals";</script>');
    });
});


module.exports = router;
