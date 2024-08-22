CREATE DATABASE UserDB;

USE UserDB;


CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY(1,1), 
    Username NVARCHAR(50) NOT NULL,    
    Email NVARCHAR(100) NOT NULL,      
    PasswordHash NVARCHAR(255) NOT NULL,
	CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Create a stored procedure for user registration
CREATE PROCEDURE RegisterUser
    @Username NVARCHAR(50),
    @Email NVARCHAR(100),
    @PasswordHash NVARCHAR(255)
AS
BEGIN
    -- Insert a new user into the Users table
    INSERT INTO Users (Username, Email, PasswordHash)
    VALUES (@Username, @Email, @PasswordHash);
END;
GO

