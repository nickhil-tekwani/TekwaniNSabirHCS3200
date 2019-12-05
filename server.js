// constants
const express = require('express');
const app = express();
const mysql = require('./node_modules/mysql');
var bodyParser = require('body-parser');

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

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
// get all info from tables
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
// student bar chart
var pieStudentQuery = "SELECT major_name AS m, COUNT(nuid) AS NoOfStudents FROM student INNER JOIN major ON student.major_id = major.major_id GROUP BY major_name"
function getStudentPieData() {
  app.get('/student/pie', (req, res) => {
    connection.query(pieStudentQuery, (err, results) => {
      if (err) {
        return res.send(err);
      } else {
        res.json(results);
      }
    });
  });
}
// faculty barchart
var pieFacultyQuery = "SELECT department_name AS d, COUNT(faculty_id) AS NoOfFaculty FROM faculty INNER JOIN department ON faculty.department_id = department.department_id GROUP BY department_name"
function getFacultyPieData() {
  app.get('/faculty/pie', (req, res) => {
    connection.query(pieFacultyQuery, (err, results) => {
      if (err) {
        return res.send(err);
      } else {
        res.json(results);
      }
    });
  });
}

// delete student
app.delete('/student/delete/:id', (req,res) => {
  connection.query('DELETE FROM student WHERE nuid = ?', [req.params.id], (err,rows,fields) => {
    if(!err) {
      res.send('deleted successfully');
    } else {
      res.send(err);
    }
  })
});
// delete building
app.delete('/building/delete/:id', (req,res) => {
  connection.query('DELETE FROM building WHERE building_id = ?', [req.params.id], (err,rows,fields) => {
    if(!err) {
      res.send('deleted successfully');
    } else {
      res.send(err);
    }
  })
});
// delete course
app.delete('/course/delete/:id', (req,res) => {
  connection.query('DELETE FROM course WHERE course_id = ?', [req.params.id], (err,rows,fields) => {
    if(!err) {
      res.send('deleted successfully');
    } else {
      res.send(err);
    }
  })
});
// delete department
app.delete('/department/delete/:id', (req,res) => {
  connection.query('DELETE FROM department WHERE department_id = ?', [req.params.id], (err,rows,fields) => {
    if(!err) {
      res.send('deleted successfully');
    } else {
      res.send(err);
    }
  })
});
// delete faculty
app.delete('/faculty/delete/:id', (req,res) => {
  connection.query('DELETE FROM faculty WHERE faculty_id = ?', [req.params.id], (err,rows,fields) => {
    if(!err) {
      res.send('deleted successfully');
    } else {
      res.send(err);
    }
  })
});
// delete major
app.delete('/major/delete/:id', (req,res) => {
  connection.query('DELETE FROM major WHERE major_id = ?', [req.params.id], (err,rows,fields) => {
    if(!err) {
      res.send('deleted successfully');
    } else {
      res.send(err);
    }
  })
});
// delete professor
app.delete('/professor/delete/:id', (req,res) => {
  connection.query('DELETE FROM professor WHERE professor_id = ?', [req.params.id], (err,rows,fields) => {
    if(!err) {
      res.send('deleted successfully');
    } else {
      res.send(err);
    }
  })
});
// delete staff
app.delete('/staff/delete/:id', (req,res) => {
  connection.query('DELETE FROM staff WHERE staff_id = ?', [req.params.id], (err,rows,fields) => {
    if(!err) {
      res.send('deleted successfully');
    } else {
      res.send(err);
    }
  })
});
// delete advisor
app.delete('/advisor/delete/:id', (req,res) => {
  connection.query('DELETE FROM advisor WHERE advisor_id = ?', [req.params.id], (err,rows,fields) => {
    if(!err) {
      res.send('deleted successfully');
    } else {
      res.send(err);
    }
  })
});

// insert a student
app.post('/student',(req, res) => {
  let b = req.body;
  var queryStuff = "SET @nuid = ?;SET @firstName = ?;SET @lastName = ?;SET @email = ?;SET @phone = ?;SET @majorID = ?; \
  CALL StudentAddOrEdit(@nuid,@firstName,@lastName,@email,@phone,@majorID);";
  connection.query(queryStuff, [b.nuid, b.firstName, b.lastName, b.email, b.phone, b.majorID], (err, rows, fields) => {
    if (!err) {
      res.send(rows);
    } else {
      console.log(err);
    }
  })
})


// update a student
app.put('/student',(req, res) => {
  let b = req.body;

  var queryStuff = "SET @nuid = ?;SET @firstName = ?;SET @lastName = ?;SET @email = ?;SET @phone = ?;SET @majorID = ?; \
  CALL StudentAddOrEdit(@nuid,@firstName,@lastName,@email,@phone,@majorID);";
  connection.query(queryStuff, [b.nuid, b.firstName, b.lastName, b.email, b.phone, b.majorID], (err, rows, fields) => {
    if (!err) {
      res.send(rows);
    } else {
      console.log(err);
    }
  })
})

// run functions for get all info
getInfo('building');
getInfo('department');
getInfo('student');
getInfo('faculty');
getInfo('course');
getInfo('advisor');
getInfo('staff');
getInfo('professor');
getInfo('major');
// run functions for get visualization chart data
getStudentPieData();
getFacultyPieData();


// port stuff
const port = 5000;

app.listen(port, () => `Server running on port ${port}`);

