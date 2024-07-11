const express = require("express");
const router = express.Router();
const db = require("../db");
const { v4: uuidv4 } = require("uuid");
const moment = require("moment");

// GET route to fetch and display all customers
router.get("/", (req, res) => {
    db.query("SELECT * FROM Customers  ORDER BY Name ASC", (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: "Error fetching customers" });
        }
        res.render("customers", { customers: results, moment: moment });
    });
});

// GET route to render the form for adding a new customer
router.get('/add', (req, res) => {
    res.render('addcustomer');
  });
  
  // POST route to insert a new customer
  router.post('/add', (req, res) => {
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
        res.redirect('/customers');
      }
    );
  });
  

  // GET route to render the form for editing a customer
router.get('/edit/:id', (req, res) => {
    const { id } = req.params;
    db.query('SELECT * FROM Customers WHERE CustomerID = ?', [id], (err, results) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Error fetching customer" });
      }
      if (results.length === 0) {
        return res.status(404).json({ message: "Customer not found" });
      }
      res.render('editCustomer', { customer: results[0], moment: moment });
    });
  });
  
  // POST route to update a customer
  router.post('/edit/:id', (req, res) => {
    const { id } = req.params;
    const { Name, Email, PhoneNumber, Address, MembershipDate } = req.body;
    db.query(
      "UPDATE Customers SET Name = ?, Email = ?, PhoneNumber = ?, Address = ?, MembershipDate = ? WHERE CustomerID = ?",
      [Name, Email, PhoneNumber, Address, MembershipDate, id],
      (err, results) => {
        if (err) {
          console.error(err);
          return res.status(500).json({ message: "Error updating customer" });
        }
        res.redirect('/customers');
      }
    );
  });


// GET route to delete a customer
router.get('/delete/:id', (req, res) => {
    const { id } = req.params;
    
    // Check if the customer has any associated records (example: rentals)
    db.query('SELECT * FROM Customers WHERE CustomerID = ?', [id], (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ message: 'Error checking rentals' });
        }

        // If there are associated records, show a message and redirect
        if (results.length > 0) {
            return res.send('<script>alert("Customer has associated records and cannot be deleted."); window.location="/customers";</script>');
        }

        // If no associated records, proceed to delete the customer
        db.query('DELETE FROM Customers WHERE CustomerID = ?', [id], (err, deleteResults) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ message: 'Error deleting customer' });
            }

            // Redirect with success message
            return res.send('<script>alert("Customer deleted successfully."); window.location="/customers";</script>');
        });
    });
});


module.exports = router;
