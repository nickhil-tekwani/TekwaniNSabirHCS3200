// constants
const express = require('express');
const app = express();
const mysql = require('./node_modules/mysql');

// connection constant
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'Northeastern',
  multipleStatements: true
});
// connect 
connection.connect((err) => {
  if (err) {
    console.log(err);
  }
  else {
    console.log('Connected to MySQL');
  }
});

// queries
function getInfo(input) {
  app.get('/' + input + '/all', (req, res) => {
    connection.query('SELECT * FROM ' + input, (err, results) => {
      if (err) {
        return res.send(err);
      } else {
        res.json(results);
      }
    });
  });
}

getInfo('building');
getInfo('department');
getInfo('student');
getInfo('faculty');
getInfo('course');
getInfo('advisor');
getInfo('staff');
getInfo('professor');
getInfo('major');


// port stuff
const port = 5000;

app.listen(port, () => `Server running on port ${port}`);

