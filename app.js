const express = require('express');
const path = require('path');
const serverless = require('serverless-http');

const app = express();
const port = 3000;

const moviesRouter = require('./routes/movies');
const customersRouter = require('./routes/customers');
const rentalsRouter = require('./routes/rentals');


app.set('view engine', 'ejs');
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (req, res) => {
    res.render('index');
});

app.use('/movies', moviesRouter);
app.use('/customers', customersRouter);
app.use('/rentals', rentalsRouter);

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});

module.exports.handler = serverless(app);