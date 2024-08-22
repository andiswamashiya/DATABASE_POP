Create database Jobs;

Use Jobs;

CREATE TABLE Organizations (
    OrganizationID INT IDENTITY(1,1) PRIMARY KEY,
    OrganizationName NVARCHAR(255) NOT NULL,
    Location NVARCHAR(255),
    ContactEmail NVARCHAR(255)
);


CREATE TABLE JobCategories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(255) NOT NULL
);
CREATE TABLE Jobs (
    JobID INT IDENTITY(1,1) PRIMARY KEY,
    JobTitle NVARCHAR(255) NOT NULL,
    Description TEXT,
    Requirements TEXT,
    OrganizationID INT,
    CategoryID INT,
    PostingDate DATE,
    FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID),
    FOREIGN KEY (CategoryID) REFERENCES JobCategories(CategoryID)
);

CREATE TABLE Donors (
    DonorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(255) NOT NULL,
    LastName NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) UNIQUE NOT NULL,
    Phone NVARCHAR(50),
    Address NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(100),
    ZipCode NVARCHAR(20),
    Country NVARCHAR(100),
    RegistrationDate DATE DEFAULT GETDATE()
);

CREATE TABLE Applications (
    ApplicationID INT IDENTITY(1,1) PRIMARY KEY,
    JobID INT,
    DonorID INT,
    ApplicationDate DATE DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT 'Submitted',
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID)
);




