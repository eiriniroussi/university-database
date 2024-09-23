/* Υπολογισμός του ποσοστού των αποφοίτων ανά χρονιά, τμήμα και επίπεδο σπουδών*/
USE GraduateInfo
GO

CREATE PROCEDURE GraduatesPercentage
    @year VARCHAR(10),
    @deptID INT,
    @studyID INT
AS
BEGIN
    -- Συνολικός αριθμός αποφοίτων ανά χρονιά
    DECLARE @GraduatesSum INT;
    SELECT @GraduatesSum = COUNT(*)
    FROM Degree
    WHERE gradYear = @year;

    -- Φοιτητές από ένα συγκεκριμένο τμήμα και επίπεδο σπουδών
    DECLARE @specificGraduates INT;
    SELECT @specificGraduates = COUNT(*)
    FROM Degree D
    JOIN Graduate G ON D.gradID = G.gradID
    WHERE D.gradYear = @year
    AND D.deptID = @deptID
    AND D.studyID = @studyID;

    -- Υπολογισμός ποσοστού
    DECLARE @percentage DECIMAL(5, 2);
    IF @GraduatesSum > 0
        SET @percentage = (@specificGraduates * 100.0) / @GraduatesSum;
    ELSE
        SET @percentage = 0;

    SELECT @percentage AS GraduatePercentage;
END