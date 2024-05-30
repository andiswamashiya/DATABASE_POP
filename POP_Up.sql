-- Create Register Table
CREATE TABLE Register (
    User_id NUMBER NOT NULL,
    username VARCHAR2(50) NOT NULL,
    password VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    registration_date DATE NOT NULL,
    CONSTRAINT PK_Register PRIMARY KEY(User_id) 
);

-- Create Donors Table
CREATE TABLE Donors (
    donor_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20) NOT NULL,
    address VARCHAR2(255) NOT NULL,
    donation_amount NUMBER NOT NULL,
    donation_date DATE NOT NULL,
    CONSTRAINT PK_Donors PRIMARY KEY (donor_id),
    CONSTRAINT FK_Register_Donors FOREIGN KEY(User_id) REFERENCES Register(User_id)
);

-- Create Volunteers Table
CREATE TABLE Volunteers (
    volunteer_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20) NOT NULL,
    address VARCHAR2(255) NOT NULL,
    availability VARCHAR2(100) NOT NULL,
    skills VARCHAR2(255) NOT NULL,
    CONSTRAINT PK_Volunteers PRIMARY KEY(volunteer_id),
    CONSTRAINT FK_Register_Volunteers FOREIGN KEY (User_id) REFERENCES Register(User_id)
);

-- Create Manager Table
CREATE TABLE Manager (
    manager_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20) NOT NULL,
    address VARCHAR2(255) NOT NULL,
    role VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_Manager PRIMARY KEY(manager_id),
    CONSTRAINT FK_Register_Manager FOREIGN KEY (user_id) REFERENCES Register(user_id)
);

-- Create Applicants Table
CREATE TABLE Applicants (
    applicant_id NUMBER NOT NULL,
    user_id NUMBER,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100),
    phone VARCHAR2(20) NOT NULL,
    address VARCHAR2(255) NOT NULL,
    applied_for VARCHAR2(50) NOT NULL,
    application_date DATE NOT NULL,
    CONSTRAINT PK_Applicants PRIMARY KEY(applicant_id),
    CONSTRAINT FK_Register_Applicants FOREIGN KEY (user_id) REFERENCES Register(user_id)
);

--Drop Table
Drop Table Register;