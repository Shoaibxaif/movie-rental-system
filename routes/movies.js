const express = require('express');
const router = express.Router();
const db = require('../db');
const { v4: uuidv4 } = require('uuid');
const moment = require('moment');

// GET route to fetch all movies and render the EJS template
router.get('/', (req, res) => {
  db.query('SELECT * FROM Movies ORDER BY Genre ASC', (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: 'Error fetching movies' });
    }
    res.render('movies', { movies: results, moment: moment });
  });
});

// GET route to render the form for adding a new movie
router.get('/add', (req, res) => {
  res.render('addMovie');
});

// POST route to insert a new movie
router.post('/add', (req, res) => {
  const { Title, Genre, ReleaseDate, Rating } = req.body;
  const MovieID = uuidv4();
  db.query(
    'INSERT INTO Movies (MovieID, Title, Genre, ReleaseDate, Rating) VALUES (?, ?, ?, ?, ?)',
    [MovieID, Title, Genre, ReleaseDate, Rating],
    (err, results) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: 'Error saving movie' });
      }
      res.redirect('/movies');
    }
  );
});

// GET route to render the edit movie form
router.get('/edit/:id', (req, res) => {
  const { id } = req.params;
  db.query('SELECT * FROM Movies WHERE MovieID = ?', [id], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: 'Error fetching movie' });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: 'Movie not found' });
    }
    res.render('editMovie', { movie: results[0], moment: moment });
  });
});

// POST route to update a movie
router.post('/edit/:id', (req, res) => {
  const { id } = req.params;
  const { Title, Genre, ReleaseDate, Rating } = req.body;
  db.query(
    'UPDATE Movies SET Title = ?, Genre = ?, ReleaseDate = ?, Rating = ? WHERE MovieID = ?',
    [Title, Genre, ReleaseDate, Rating, id],
    (err, results) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: 'Error updating movie' });
      }
      res.redirect('/movies');
    }
  );
});

// GET route to delete a movie
router.get('/delete/:id', (req, res) => {
  const { id } = req.params;

  // Check if the movie is rented
  db.query('SELECT * FROM Rentals WHERE Title IN (SELECT Title FROM Movies WHERE MovieID = ?)', [id], (err, rentalResults) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: 'Error checking rentals' });
    }

    // If there are rentals, return an alert to the client
    if (rentalResults.length > 0) {
      return res.send('<script>alert("Movie is rented and cannot be deleted."); window.location="/movies";</script>');
    }

    // If no rentals, proceed to delete the movie
    db.query('DELETE FROM Movies WHERE MovieID = ?', [id], (err, deleteResults) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: 'Error deleting movie' });
      }
      
      // Redirect with success message
      return res.send(`
        <script>
          alert("Movie deleted successfully.");
          window.location="/movies";
        </script>
      `);
    });
  });
});


module.exports = router;
