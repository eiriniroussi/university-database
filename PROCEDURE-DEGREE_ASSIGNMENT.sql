/* Ανάθεση νέου πτυχίου σε κάποιον απόφοιτο*/
USE GraduateInfo
GO

CREATE PROCEDURE DegreeAssignment
    @gradYear VARCHAR(10),
    @grade DECIMAL(4, 2),
    @studyID INT,
    @regYear VARCHAR(10),
    @deptID INT,
    @gradID INT
AS
BEGIN
    INSERT INTO Degree (gradYear,regYear,gradID, grade, studyID, deptID)
    VALUES (@gradYear,@regYear, @gradID, @grade, @studyID, @deptID);
END

