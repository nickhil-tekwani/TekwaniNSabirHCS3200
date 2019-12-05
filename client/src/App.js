import React, { Component } from 'react';
import logo from './nuSeal.png';
import './App.css';
import DropDown from './modules/dropdown';
import Data from './components/allData';
import { Button, Grid } from '@material-ui/core';
import SearchBar from './modules/searchbar';

var dropOptions = [
  { optionName: ('Building') },
  { optionName: ('Department') },
  { optionName: ('Student') },
  { optionName: ('Faculty') },
  { optionName: ('Course') },
  { optionName: ('Advisor') },
  { optionName: ('Staff') },
  { optionName: ('Professor') },
  { optionName: ('Major') }
];

var noId = 'No ID Inputted!'
var noTable = 'No Category Selected from Dropdown!'
var notNum = 'Given ID Contains Non-Number Characters!'

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      currentIc: 'none',
      input: 'none',
      message: '',
      box: <div> </div>,

      firstName: '',
      lastName: '',
      email: '',
      phone: 0,
      majorID: 0

    }
    this.handleIcChange = this.handleIcChange.bind(this);
  }

  // for drop down
  handleIcChange(value) {
    this.setState({ currentIc: value });
  }

  // for searchbar
  handleSearchChange = value => {
    this.setState({ input: value });
  };

  // checks if string contains only numerics
  allnumeric(inputtxt) {
    var numbers = /^[0-9]+$/;
    if (inputtxt.match(numbers)) {
      return true;
    } else {
      return false;
    }
  }

  // for create button
  handleCreate = input => {
    var newMessage = 'Record Created in ' + this.state.currentIc + ' Table!'

    if (this.state.input.trim() === '') {
      this.setState({ message: noId })
    } else if (this.state.currentIc === '' || this.state.currentIc === 'none') {
      this.setState({ message: noTable })
    } else if (!this.allnumeric(this.state.input)) {
      this.setState({ message: notNum })
    } else {
      this.setState({ message: newMessage })
      this.sendCreate();
    }
  };

  // send create
  sendCreate = input => {
    const data = {
      "nuid": 0,
      "firstName": this.state.firstName,
      "lastName": this.state.lastName,
      "email": this.state.email,
      "phone": this.state.phone,
      "majorID": this.state.majorID
    };

    const requestOptions = {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    };

    let c = this.state.currentIc;

    if (c === "none") {
      // do nothing
    } else {
      fetch('/' + c, requestOptions).then((response) => {
        console.log('here')
        return response.json();
      }).then((result => {
        console.log('successful create');
        console.log(result);
      })).catch((error) => {
        console.log(error)
      })
    }
  }


  // for update button
  handleUpdate = input => {
    var newMessage = 'Record with ID = ' + this.state.input + ' Updated in ' + this.state.currentIc + ' Table!'
    if (this.state.input.trim() === '') {
      this.setState({ message: noId })
    } else if (this.state.currentIc === '' || this.state.currentIc === 'none') {
      this.setState({ message: noTable })
    } else if (!this.allnumeric(this.state.input)) {
      this.setState({ message: notNum })
    } else {
      this.setState({ message: newMessage })
      // SEND UPDATE
      this.sendUpdate();
    }
  };

  // send update
  sendUpdate = input => {
    const data = {
      "nuid": this.state.input,
      "firstName": this.state.firstName,
      "lastName": this.state.lastName,
      "email": this.state.email,
      "phone": this.state.phone,
      "majorID": this.state.majorID
    };

    const requestOptions = {
      method: 'PUT',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    };

    let c = this.state.currentIc;

    if (c === "none") {
      // do nothing
    } else {
      fetch('/' + c, requestOptions).then((response) => {
        console.log('here')
        return response.json();
      }).then((result => {
        console.log('successful update');
        console.log(result);
      })).catch((error) => {
        console.log(error)
      })
    }
  }


  // onclick for delete button
  handleDelete = input => {
    var newMessage = 'Record with ID = ' + this.state.input + ' Deleted in ' + this.state.currentIc + ' Table!'
    if (this.state.input.trim() === '') {
      this.setState({ message: noId })
    } else if (this.state.currentIc === '' || this.state.currentIc === 'none') {
      this.setState({ message: noTable })
    } else if (!this.allnumeric(this.state.input)) {
      this.setState({ message: notNum })
    } else {
      this.setState({ message: newMessage })

      // SEND DELETE
      this.sendDelete(this.state.input);
    }
  };

  // fetches delete
  sendDelete = inputId => {
    const requestOptions = {
      method: 'DELETE'
    };
    let c = this.state.currentIc;
    if (c === "none") {
      // do nothing
    } else {
      fetch(c + '/delete/' + inputId, requestOptions).then((response) => {
        return response.json();
      }).then((result => {
        console.log('successful delete');
        console.log(result);
      }))
    }
  }
  // student
  handleFirstNameChange = value => { this.setState({ firstName: value }); };
  handleLastNameChange = value => { this.setState({ lastName: value }); };
  handleEmailChange = value => { this.setState({ email: value }); };
  handlePhoneChange = value => { this.setState({ phone: value }); };
  handleMajorID = value => { this.setState({ majorID: value }); };


  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Northeastern University Analytics</h1>
        </header>
        <br />

        <Grid container justify="center" spacing={2} direction="row" alignItems="center">
          <Grid item> <br /> <SearchBar inputType={'ID'} changeFunc={this.handleSearchChange} fontSize={'18px'} />  </Grid>
          <Grid item> <DropDown title={'Category'} options={dropOptions} changeFunc={this.handleIcChange} currentVal={this.state.currentIc} /> </Grid>
          <Grid item> <br /> ID: {this.state.input} | Table: {this.state.currentIc} </Grid>
        </Grid>

        <br />
        Student Info (all must be filled to create or update, including id and category above. ID, phone (aka 3 digit area code), and majorID must be integers)

        <Grid container justify="center" spacing={1} direction="row">
          <Grid item> <SearchBar inputType={'First Name'} changeFunc={this.handleFirstNameChange} fontSize={'12px'} />  </Grid>
          <Grid item> <SearchBar inputType={'Last Name'} changeFunc={this.handleLastNameChange} fontSize={'12px'} /> </Grid>
          <Grid item> <SearchBar inputType={'Email'} changeFunc={this.handleEmailChange} fontSize={'12px'} /> </Grid>
          <Grid item> <SearchBar inputType={'Phone'} changeFunc={this.handlePhoneChange} fontSize={'12px'} /> </Grid>
          <Grid item> <SearchBar inputType={'Major ID'} changeFunc={this.handleMajorID} fontSize={'12px'} /> </Grid>

        </Grid>

        <br />
        <br />
        <Grid container justify="center" spacing={2}>
          <Grid item> <Button variant="contained" onClick={this.handleCreate}> Create New </Button> </Grid>
          <Grid item> <Button variant="contained" onClick={this.handleUpdate}> Update Existing </Button> </Grid>
          <Grid item> <Button variant="contained" onClick={this.handleDelete}> Delete </Button> </Grid>
        </Grid>
        <br />
        {this.state.message}
        <br />
        <hr />
        <Data current={this.state.currentIc} currentPie={this.state.currentIc} />

      </div>

    );
  }
}

export default App;
