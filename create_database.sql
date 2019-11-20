/*
-- Create code for the Northeastern database

Order of Creation:
1.Building
2.Department
3.Course
4.Major
5.Faculty
7.Student
8.Professor
9.Advisor
10.Staff
*/

-- create the database
DROP DATABASE IF EXISTS Northeastern;
CREATE DATABASE Northeastern;

-- select the database
USE Northeastern;

-- create the tables
DROP TABLE IF EXISTS building;
CREATE TABLE building
(
  building_id  INT PRIMARY KEY AUTO_INCREMENT,
  building_name	VARCHAR(50) NOT NULL,
  street_name  VARCHAR(40) NOT NULL,
  street_number INT NOT NULL,
  zipcode VARCHAR(5) NOT NULL
);

DROP TABLE IF EXISTS department;
CREATE TABLE department
(
  department_id  INT PRIMARY KEY AUTO_INCREMENT,
  department_name	VARCHAR(50) NOT NULL,
  department_building INT NOT NULL,
  FOREIGN KEY (department_building) REFERENCES building (building_id)
);

DROP TABLE IF EXISTS course;
CREATE TABLE course
(
  course_id INT PRIMARY KEY AUTO_INCREMENT,
  course_name	VARCHAR(50) NOT NULL,
  course_number VARCHAR(40) NOT NULL,
  department_id INT NOT NULL,
  FOREIGN KEY (department_id) REFERENCES department (department_id)
);

DROP TABLE IF EXISTS major;
CREATE TABLE major
(
  major_id INT PRIMARY KEY AUTO_INCREMENT,
  major_name	VARCHAR(50) NOT NULL,
  department_id INT NOT NULL,
  isCombined BOOLEAN NOT NULL,
  FOREIGN KEY (department_id) REFERENCES department (department_id)
);

DROP TABLE IF EXISTS faculty;
CREATE TABLE faculty
(
  faculty_id INT PRIMARY KEY AUTO_INCREMENT,
  faculty_firstname	VARCHAR(50) NOT NULL,
  faculty_lastname VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  department_id INT NOT NULL,
  isFullTime BOOLEAN NOT NULL,
  FOREIGN KEY (department_id) REFERENCES department (department_id)
);

DROP TABLE IF EXISTS professor;
CREATE TABLE professor
(
  professor_id INT PRIMARY KEY AUTO_INCREMENT,
  status VARCHAR(8) NOT NULL,
  master_id INT NOT NULL,
  FOREIGN KEY (master_id) REFERENCES faculty (faculty_id)
);

DROP TABLE IF EXISTS advisor;
CREATE TABLE advisor
(
  advisor_id INT PRIMARY KEY AUTO_INCREMENT,
  type VARCHAR(20) NOT NULL,
  master_id INT NOT NULL,
  FOREIGN KEY (master_id) REFERENCES faculty (faculty_id)
);

DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
  staff_id INT PRIMARY KEY AUTO_INCREMENT,
  role VARCHAR(20) NOT NULL,
  master_id INT NOT NULL,
  FOREIGN KEY (master_id) REFERENCES faculty (faculty_id)
);
