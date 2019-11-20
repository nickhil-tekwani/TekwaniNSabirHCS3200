import React from 'react';
import { Select, FormControl, InputLabel } from '@material-ui/core';
import MenuItem from '@material-ui/core/MenuItem';

// var exampleOptionsArray = [
//   { optionName: ('option1') },
//   { optionName: ('option2') },
//   { optionName: ('option3') },
//   { optionName: ('option4') },
//   { optionName: ('option5') },
// ];


// DropDown is a class that builds a drop down menu with menu items based on array input (see example array above)
// all components used below are from material UI 

// required props:
// changeFunc: the handle change function - this is used to pass up state of the selected option to the parent class
// title: the title of the dropdown / type of things given to it (e.g. 'vertexType')
// options: array used to build the MenuItems (see exampleOptionsArray above)
// currentVal: state of the currently selected menu item, passed down from the state of the parent
// e.g: <DropDown title={'TitleString'} changeFunc={this.handleChange} options={dropdownArray} currentVal={this.state.value}/>

// example of a changeFunc (handleChange) function from the parent:
// handleChange = value => {
//   this.setState({ input: value });
// };

// example from ScorecardPage: <DropDown title={'Issue Cat'} options={this.state.icOptions} changeFunc={this.handleIcChange} currentVal={this.state.currentIc}/>

export default class DropDown extends React.Component {

    constructor(props){
      super(props);
       this.handleChange = this.handleChange.bind(this);
    }
   
    handleChange = event => {
      this.props.changeFunc(event.target.value);
    };

    render() {
      let list = this.props.options;
      let title = this.props.title;

      return (
        <React.Fragment>
          <FormControl>

            {/* title right above the drop down */}
            <InputLabel> {title} </InputLabel>

            {/* material UI select component */}
            <Select onChange={this.handleChange} value={this.props.currentVal}>

              {/* default option  */}
              <MenuItem key='' value='none' id={'no' + title}> No {title} Selected </MenuItem>

              {/* map for all the other options fom optionsArray */}
              {list.map((list, index) => (
                  <MenuItem key={list.optionName} id={title + index} value={list.optionName}>
                    {list.optionName}
                  </MenuItem>
              ))}
              
            </Select>

          </FormControl>
        </React.Fragment>
      );
    }
}