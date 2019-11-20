import React, { Component } from 'react';
import './component.css';

class Building extends Component {
  constructor() {
    super();
    this.state = {
      allBuildings: []
    };
  }

  componentDidMount() {
    fetch('/building/all')
      .then(res => res.json())
      .then(allBuildings => this.setState({allBuildings}, () => console.log('all buildings fetched...', allBuildings)));
      console.log(this.state.allBuildings);
  }

  render() {
    return (
      <div>
        <h2>Buildings</h2>
        <ul>
        {this.state.allBuildings.map(allBuildings => 
          <li key={allBuildings.building_id}> {allBuildings.building_name} {allBuildings.street_name} {allBuildings.street_number} {allBuildings.zipcode}</li>
        )}
        </ul>
      </div>
    );
  }
}

export default Building;
