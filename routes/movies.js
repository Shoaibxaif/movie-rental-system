const express = require("express");
const router = express.Router();
const db = require("../db");
const { v4: uuidv4 } = require("uuid");
const moment = require("moment");

// GET route to fetch all movies and render the EJS template
router.get("/", (req, res) => {
  db.query("SELECT * FROM Movies", (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: "Error fetching movies" });
    }
    res.render("movies", { movies: results , moment: moment });
  });
});

// POST route to insert a new movie
router.post("/", (req, res) => {
  const { Title, Genre, ReleaseDate, Rating } = req.body;
  const MovieID = uuidv4();
  db.query(
    "INSERT INTO Movies (MovieID, Title, Genre, ReleaseDate, Rating) VALUES (?, ?, ?, ?, ?)",
    [MovieID, Title, Genre, ReleaseDate, Rating],
    (err, results) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Error saving movie" });
      }
      res.status(200).json({ message: "Movie saved successfully" });
    }
  );
});

module.exports = router;
