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

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      currentIc: '',
      input: '',
      message: ''
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

  // for create button
  handleCreate = input => {
    var newMessage = 'Record with ID = ' + this.state.input + ' Created in ' + this.state.currentIc + ' Table!'
    this.setState({ message: newMessage})
  };

  // for update existing button
  handleUpdate = input => {
    var newMessage = 'Record with ID = ' + this.state.input + ' Updated in ' + this.state.currentIc + ' Table!'
    this.setState({ message: newMessage})
  };

  // for delete button
  handleDelete = input => {
    var newMessage = 'Record with ID = ' + this.state.input + ' Deleted in ' + this.state.currentIc + ' Table!'
    this.setState({ message: newMessage})
  };

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Northeastern University Analytics</h1>
        </header>
        <br />
        <SearchBar inputType={'ID'} changeFunc={this.handleSearchChange} fontSize={'18px'}/> 
        {this.state.input}
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
        <br />
        <hr />
        <DropDown title={'Option'} options={dropOptions} changeFunc={this.handleIcChange} currentVal={this.state.currentIc} />

        <Data current={this.state.currentIc} />

      </div>

    );
  }
}

export default App;
