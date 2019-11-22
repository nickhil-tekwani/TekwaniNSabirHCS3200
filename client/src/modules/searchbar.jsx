import React from 'react';

// SearchBar is a class that builds a text input
// main components used below are natural react/js

// required props:
// changeFunc: the handle change function - this is used to pass up state of the input to the parent class
// inputType: the kind of thing being inputted
// fontSize: size of the input box
// e.g:<SearchBar inputType={'ID'} changeFunc={this.handleSearchChange} fontSize={'15px'}/>

// example of a changeFunc (handleChange) function from the parent:
// handleChange = value => {
//   this.setState({ input: value });
// };

export default class Searchbar extends React.Component {

    constructor(props){
      super(props);
    }
   
    handleChange = event => {
      this.props.changeFunc(event.target.value);
    };
   
    render() {
      return (
        <React.Fragment>
          <form>
            <label style={{fontSize: this.props.fontSize}}> {this.props.inputType}: </label>
            <input
              style={{fontSize: this.props.fontSize}}
              type="text"
              name="input"
              onChange={this.handleChange}
            />
          </form>

        </React.Fragment>
      );
    }
}