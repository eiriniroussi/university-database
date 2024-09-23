/* Εμφάνιση της υψηλότερης και χαμηλότερης βαθμολογίας ανά τμήμα*/
USE GraduateInfo
GO

CREATE PROCEDURE GradesRangePerStudyLevel
@studyLevel INT
AS
BEGIN
    SELECT SL.studyLevel, MAX(D.grade) AS HighestGrade, MIN(D.grade) AS LowestGrade
    FROM StudyLevel SL
    JOIN Degree D ON SL.studyID = D.studyID
    WHERE SL.studyID = @studyLevel
    GROUP BY SL.studyLevel;
END