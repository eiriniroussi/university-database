CREATE DATABASE GraduateInfo

USE GraduateInfo

--Tables Creation
CREATE TABLE Graduate(
    gradID INT IDENTITY (1, 1) PRIMARY KEY,
    studNumber INT UNIQUE,
    fName VARCHAR (100) COLLATE SQL_Latin1_General_CP1253_CI_AI NOT NULL,
    lName VARCHAR (100) COLLATE SQL_Latin1_General_CP1253_CI_AI NOT NULL,
    fathersName VARCHAR (100) COLLATE SQL_Latin1_General_CP1253_CI_AI NOT NULL,
    birthDate DATE NOT NULL ,
    email VARCHAR (200) NOT NULL
);

CREATE TABLE Degree(
    degreeID INT IDENTITY (1, 1) NOT NULL,
    gradYear VARCHAR (10)   NULL,
    regYear  VARCHAR (10)   NOT NULL,
    gradID   INT            NOT NULL,
    grade    DECIMAL (4, 2) NOT NULL,
    studyID  INT            NOT NULL,
    deptID   INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([degreeID] ASC),
    CONSTRAINT [chek_GradYear] CHECK ([gradYear]<=datepart(year,getdate())),
    CONSTRAINT [chek_RegYear] CHECK ([regYear]<=datepart(year,getdate())),
    CONSTRAINT [FK_Degree_Graduate] FOREIGN KEY ([gradID]) REFERENCES Graduate ([gradID]),
    CONSTRAINT [FK_Department_Degree] FOREIGN KEY ([deptID]) REFERENCES Department ([deptID]),
    CONSTRAINT [FK_StudyLevel_Degree] FOREIGN KEY ([studyID]) REFERENCES StudyLevel ([studyID])
);

CREATE TABLE StudyLevel(
    studyID INT PRIMARY KEY IDENTITY(1,1),
    studyLevel VARCHAR (100) COLLATE SQL_Latin1_General_CP1253_CI_AI NOT NULL
);

CREATE TABLE Department (
    deptID INT IDENTITY (1, 1) PRIMARY KEY,
    deptName VARCHAR (100) COLLATE SQL_Latin1_General_CP1253_CI_AI NOT NULL,
    facultyID INT NOT NULL,
    CONSTRAINT FK_DepartmentFaculty FOREIGN KEY (facultyID) REFERENCES Faculty (facultyID)
);

CREATE TABLE Faculty (
    facultyID INT PRIMARY KEY IDENTITY(1,1),
    fName VARCHAR (100) COLLATE SQL_Latin1_General_CP1253_CI_AI NOT NULL
);


CREATE TABLE CareerCategory(
    careerID INT IDENTITY (1, 1) PRIMARY KEY,
    categoryTitle VARCHAR (100) COLLATE SQL_Latin1_General_CP1253_CI_AI NOT NULL
);

CREATE TABLE Company (
    companyID INT PRIMARY KEY IDENTITY(1,1),
    companyName VARCHAR (100) COLLATE SQL_Latin1_General_CP1253_CI_AI NULL,
    companyLocation VARCHAR (100) COLLATE SQL_Latin1_General_CP1253_CI_AI NULL
);

CREATE TABLE Placement(
    placementCode INT PRIMARY KEY,
    placementTitle VARCHAR (100) COLLATE SQL_Latin1_General_CP1253_CI_AI NOT NULL,
    emplStart DATE NOT NULL,
    emplFinish DATE NULL,
    careerID INT NOT NULL,
    companyID INT NOT NULL,
    gradID INT NOT NULL,
    CONSTRAINT FK_Placement_Graduate FOREIGN KEY (gradID) REFERENCES Graduate (gradID),
    CONSTRAINT FK_Placement_CareerCategory FOREIGN KEY (careerID) REFERENCES CareerCategory (careerID),
    CONSTRAINT FK_Placement_Company FOREIGN KEY (companyID) REFERENCES Company (companyID),
    CHECK (emplFinish IS NULL OR emplFinish <= CAST(GETDATE() AS DATE))
);


--Checks
ALTER TABLE Placement
ADD CONSTRAINT chk_EmplStartDate CHECK (emplStart < GETDATE());

ALTER TABLE Placement
ADD CONSTRAINT chk_EmplFinishDate CHECK (emplFinish < GETDATE());

ALTER TABLE Graduate
ADD CONSTRAINT chk_BirthDate CHECK (birthDate <= DATEADD(year, -18, GETDATE()));

ALTER TABLE Degree
ADD CONSTRAINT chk_GradYear CHECK (gradYear <= YEAR(GETDATE()));

ALTER TABLE Graduate
ADD CONSTRAINT chk_studNumber_length CHECK (LEN(studNumber) = 8 AND studNumber > 9999999);
