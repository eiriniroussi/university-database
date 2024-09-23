/* Προσθήκη νέου αποφοίτου*/
USE GraduateInfo
GO

CREATE PROCEDURE AddNewGraduate
    @studNumber INT,
    @fName VARCHAR(100),
    @lName VARCHAR(100),
    @fathersName VARCHAR(200),
    @birthDate DATE,
    @email VARCHAR(100)
AS
BEGIN
    INSERT INTO Graduate (studNumber, fName, lName, fathersName, birthDate, email)
    VALUES (@studNumber, @fName, @lName, @fathersName, @birthDate, @email);
END
