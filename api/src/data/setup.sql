CREATE DATABASE openHealth;
GO;

USE openHealth;
GO;

CREATE TABLE [gender] (
    [id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY
    [value] VARCHAR(50)
);
GO;

INSERT INTO [gender] (value)
VALUES ('Male'), ('Female'), ('Not known');
GO;

CREATE TABLE [patient_references] (
    [id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY
    [reference] VARCHAR(7)
);
GO;

INSERT INTO [patient_references] (reference)
VALUES ('0000001');
GO;

CREATE TABLE [patient_demographic] (
    [reference] INT NOT NULL FOREIGN KEY REFERENCES [patient_references](id)
    [nhs_number] NVARCHAR(20) NOT NULL 
    [surname] NVARCHAR(255)
    [first_name] NVARCHAR(255)
    [gender] INT FOREIGN KEY REFERENCES [gender](id)
);
GO;

INSERT INTO [patient_demographic] (reference, nhs_number, surname, first_name, gender)
VALUES (1, '123 456 7890', 'Doe', 'John', 1);
GO;

CREATE TABLE [patient_address] (
    [reference] INT NOT NULL FOREIGN KEY REFERENCES [patient_references](id)
    [first_line_address] VARCHAR(255)
    [second_line_address] VARCHAR(255)
    [city] VARCHAR(255)
    [county] VARCHAR(255)
    [country] VARCHAR (255)
    [postcode] VARCHAR(255)
);
GO;

INSERT INTO [patient_address ] (reference, first_line_address, second_line_address, city, county, country, postcode)
VALUES (1, '1 Queen Road', 'Ashton Grove', 'Bristol', 'Bristol, city of', 'England', 'BS1 1AA');
GO;




