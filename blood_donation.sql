-- Create tables

-- Table for donors
CREATE TABLE Donors (
    DonorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    BloodType VARCHAR(5),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    LastDonationDate DATE
);

-- Table for blood donations
CREATE TABLE BloodDonations (
    DonationID INT PRIMARY KEY,
    DonorID INT,
    DonationDate DATE,
    BloodType VARCHAR(5),
    QuantityInMl INT,
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID)
);

-- Additional functionality: Blood Inventory Management
CREATE TABLE BloodInventory (
    InventoryID INT PRIMARY KEY,
    BloodType VARCHAR(5),
    QuantityInMl INT,
    ExpiryDate DATE
);

-- Additional functionality: Donation Centers
CREATE TABLE DonationCenters (
    CenterID INT PRIMARY KEY,
    CenterName VARCHAR(100),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15)
);

-- Additional functionality: Donation Appointments
CREATE TABLE DonationAppointments (
    AppointmentID INT PRIMARY KEY,
    DonorID INT,
    CenterID INT,
    AppointmentDate DATE,
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID),
    FOREIGN KEY (CenterID) REFERENCES DonationCenters(CenterID)
);

-- Additional functionality: Blood Test Results
CREATE TABLE BloodTestResults (
    TestID INT PRIMARY KEY,
    DonationID INT,
    TestDate DATE,
    TestType VARCHAR(100),
    TestResult VARCHAR(255),
    FOREIGN KEY (DonationID) REFERENCES BloodDonations(DonationID)
);

-- Additional functionality: Blood Request
CREATE TABLE BloodRequests (
    RequestID INT PRIMARY KEY,
    RequesterName VARCHAR(100),
    RequesterContact VARCHAR(15),
    BloodType VARCHAR(5),
    QuantityNeeded INT,
    RequestDate DATE,
    Status VARCHAR(20)
);

-- Sample data insertion for testing purposes
INSERT INTO Donors (DonorID, FirstName, LastName, DateOfBirth, Gender, BloodType, Address, PhoneNumber, Email, LastDonationDate)
VALUES (1, 'John', 'Doe', '1985-05-10', 'Male', 'O+', '123 Main St, Anytown', '123-456-7890', 'john.doe@example.com', '2023-12-01');

INSERT INTO BloodDonations (DonationID, DonorID, DonationDate, BloodType, QuantityInMl)
VALUES (1, 1, '2024-03-20', 'O+', 500);

-- More sample data insertion for other tables...

-- Sample query: Get all blood donations by a specific donor
SELECT * FROM BloodDonations WHERE DonorID = 1;
