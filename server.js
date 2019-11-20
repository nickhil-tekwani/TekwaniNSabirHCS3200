const express = require('express');
const app = express();

const mysql = require('./node_modules/mysql');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'Northeastern',
  multipleStatements: true
});

connection.connect((err) => {
  if (err) {
    console.log(err);
  }
  else {
    console.log('Connected to MySQL');
  }
});

app.get('/building/all', (req, res) => {
  connection.query('SELECT * FROM building', (err, results) => {
    if (err) {
      return res.send(err);
    } else {
      res.json(results);
    }
  });
});

const port = 5000;

app.listen(port, () => `Server running on port ${port}`);

