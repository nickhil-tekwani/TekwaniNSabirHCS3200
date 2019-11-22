import React, { Component } from 'react';
import './component.css';

class Data extends Component {
    constructor(props) {
        super(props);
        this.state = {
            data: []
        };
    }

    componentDidUpdate() {
        fetch('/' + this.props.current + '/all')
            .then(res => res.json())
            .then(data => this.setState({ data }, () => console.log('data fetched...')));
    }

    routeServer(c) {
        console.log(this.state.data)
        if (c === "Building") {
            return this.state.data.map(data => <li key={data.building_id}> {data.building_name}: {data.street_number} {data.street_name}, {data.zipcode}</li>)
        } else if (c === "Department") {
            return this.state.data.map(data => <li key={data.department_id}> {data.department_name} BuildingID: {data.department_building} </li>)
        } else if (c === "Student") {
            return this.state.data.map(data => <li key={data.nuid}> {data.student_firstname} {data.student_lastname} MajorID: {data.major_id} {data.phone} {data.email}</li>)
        } else if (c === "Faculty") {
            return this.state.data.map(data => <li key={data.faculty_id}> {data.faculty_firstname} {data.faculty_lastname} {data.email} {data.isFullTime} DepartmentID: {data.department_id} </li>)
        } else if (c === "Course") {
            return this.state.data.map(data => <li key={data.course_id}> {data.course_name} {data.course_number} DepartmentID: {data.department_id}</li>)
        } else if (c === "Advisor") {
            return this.state.data.map(data => <li key={data.advisor_id}> {data.type} MasterID: {data.master_id}</li>)
        } else if (c === "Staff") {
            return this.state.data.map(data => <li key={data.staff_id}> {data.role} MasterID: {data.master_id}</li>)
        } else if (c === "Professor") {
            return this.state.data.map(data => <li key={data.professor_id}> {data.status} MasterID: {data.master_id}</li>)
        } else if (c === "Major") {
            return this.state.data.map(data => <li key={data.major_id}> {data.major_name} {data.isCombined} DepartmentID: {data.department_id} </li>)
        }
    }

    render() {
        return (
            <div>
                <h2>{this.props.current}</h2>
                <ul>
                    {/* {this.state.data.map(data =>
                        <li key={data.building_id}> {data.building_name} {data.street_name} {data.street_number} {data.zipcode}</li>
                    )} */}
                    {this.routeServer(this.props.current)}
                </ul>
            </div>
        );
    }
}

export default Data;
