/*Λίστα αποφοίτων ανά τμήμα*/
USE GraduateInfo
GO

CREATE PROCEDURE GraduatesByDepartment
    @deptID INT
AS
BEGIN
    SELECT G.* 
    FROM Graduate G
    JOIN Degree D ON G.gradID = D.gradID
    WHERE D.deptID = @deptID;
END