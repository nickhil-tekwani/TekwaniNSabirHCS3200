import React, { Component } from 'react';
import logo from './nuLogo.jpg';
import './App.css';
import Building from './components/building';
import DropDown from './modules/dropdown';

var dropOptions = [
  { optionName: ('Building') },
  { optionName: ('Department') },
  { optionName: ('Student') },
  { optionName: ('Faculty') },
  { optionName: ('Course') },
];

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      data: [],
      currentIc: ''
    }
    this.handleIcChange = this.handleIcChange.bind(this);
  }

  // for drop down for task cat / issue cat breakdown 
  handleIcChange(value) {
    this.setState({ currentIc: value });
  }

  analytics(value) {
    if (value === 'Building') {
      return (<Building />)
    } else {
      return (<h2> nothing </h2>)
    }
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Northeastern University Analytics</h1>
        </header>
        <DropDown title={'Options'} options={dropOptions} changeFunc={this.handleIcChange} currentVal={this.state.currentIc}/>
        { console.log(this.state.currentIc)}

        {this.analytics(this.state.currentIc)}
        
      </div>

    );
  }
}

export default App;
