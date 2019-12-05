import React, { Component } from 'react';
import './component.css';
import {
    BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend,
} from 'recharts';
import { Button } from '@material-ui/core';


class Data extends Component {
    constructor(props) {
        super(props);
        this.state = {
            data: [],
            pieData: [],
            msg: ''
        };
    }

    routeServer(c) {
        // console.log(this.state.data)
        if (c === "Building") {
        return this.state.data.map(data => <li key={data.building_id}> (id = {data.building_id}) {data.building_name}: {data.street_number} {data.street_name}, {data.zipcode}</li>)
        } else if (c === "Department") {
            return this.state.data.map(data => <li key={data.department_id}> (id = {data.department_id}) {data.department_name} BuildingID: {data.department_building} </li>)
        } else if (c === "Student") {
            return this.state.data.map(data => <li key={data.nuid}> (id = {data.nuid}) {data.student_firstname} {data.student_lastname} MajorID: {data.major_id} {data.phone} {data.email}</li>)
        } else if (c === "Faculty") {
            return this.state.data.map(data => <li key={data.faculty_id}> (id = {data.faculty_id}) {data.faculty_firstname} {data.faculty_lastname} {data.email} {data.isFullTime} DepartmentID: {data.department_id} </li>)
        } else if (c === "Course") {
            return this.state.data.map(data => <li key={data.course_id}> (id = {data.course_id}) {data.course_name} {data.course_number} DepartmentID: {data.department_id}</li>)
        } else if (c === "Advisor") {
            return this.state.data.map(data => <li key={data.advisor_id}> (id = {data.advisor_id}) {data.type} MasterID: {data.master_id}</li>)
        } else if (c === "Staff") {
            return this.state.data.map(data => <li key={data.staff_id}> (id = {data.staff_id}) {data.role} MasterID: {data.master_id}</li>)
        } else if (c === "Professor") {
            return this.state.data.map(data => <li key={data.professor_id}> (id = {data.professor_id}) {data.status} MasterID: {data.master_id}</li>)
        } else if (c === "Major") {
            return this.state.data.map(data => <li key={data.major_id}> (id = {data.major_id}) {data.major_name} {data.isCombined} DepartmentID: {data.department_id} </li>)
        }
    }

    routePieServer(c) {
        // console.log(this.state.pieData)
        if (c === "Student") {
            return (
                <div>
                    <h3> Student Breakdown By Major </h3>
                    <BarChart
                        width={500}
                        height={300}
                        data={this.state.pieData}
                        margin={{
                            top: 5, right: 30, left: 20, bottom: 5,
                        }}
                    >
                        <CartesianGrid strokeDasharray="3 3" />
                        <XAxis dataKey="m" />
                        <YAxis />
                        <Tooltip />
                        <Legend />
                        <Bar dataKey="NoOfStudents" fill="#8884d8" />
                    </BarChart>
                </div>
            )
        } else if (c === "Faculty") {
            return (
                <div>
                    <h3> Faculty Breakdown By Department </h3>
                    <BarChart
                        width={500}
                        height={300}
                        data={this.state.pieData}
                        margin={{
                            top: 5, right: 30, left: 20, bottom: 5,
                        }}
                    >
                        <CartesianGrid strokeDasharray="3 3" />
                        <XAxis dataKey="d" />
                        <YAxis />
                        <Tooltip />
                        <Legend />
                        <Bar dataKey="NoOfFaculty" fill="#8884d8" />
                    </BarChart>
                </div>
            )
        } else if (c === "none") {
            return "";
        } else {
            return "Select Student or Faculty to View Appropriate Bar Chart!"
        }
    }

    title(c) {
        if (c === "none") {
            return "No Category Selected!"
        } else {
            return c;
        }
    }
     // onclick for getData button
    handleGet = input => {
        if (this.props.current === "none") {
            this.setState( {msg: 'Please Select a Category!'})
        } else { 
            this.setState( {msg: '' });
        fetch('/' + this.props.current + '/all')
            .then(res => res.json())
            .then(data => this.setState({ data }, () => "console.log('data fetched...')"))
            .catch((error) => {
                console.log(error)
            })
        }

        if (this.props.currentPie === "Student" || this.props.currentPie === "Faculty") {
            fetch('/' + this.props.currentPie + '/pie')
                .then(res => res.json())
                .then(pieData => this.setState({ pieData }, () => "console.log('pie data fetched... ')"))
                .catch((error) => {
                    console.log(error)
                })
        } else {
            // do nothing
        }
  };

    render() {
        return (
            <div>
                <Button variant="contained" onClick={this.handleGet}> Get Data on Category </Button>
                {this.state.msg}
                <h2>{this.title(this.props.current)}</h2>
                <ul>
                    {this.routeServer(this.props.current)}
                    <h2> Bar Chart </h2>
                    {this.routePieServer(this.props.currentPie)}
                    

                    <br />
                </ul>
            </div>
        );
    }
}

export default Data;
