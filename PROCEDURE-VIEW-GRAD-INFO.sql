/* Εμφάνιση στοιχείων απόφοιτου (Προσωπικά στοιχεία, Πτυχία, Επαγγελματική πορεία εάν υπάρχει)*/
USE GraduateInfo
GO


CREATE PROCEDURE GraduateDegreePlacement
    @gradID INT
AS
BEGIN
    SELECT G.lName, G.birthDate, G.studNumber, D.regYear, D.gradYear, D.grade, P.placementTitle, P.emplStart, P.emplFinish
    FROM Graduate G
    JOIN Degree D ON G.gradID = D.gradID
    LEFT JOIN Placement P ON P.gradID = G.gradID
    WHERE G.gradID = @gradID;
END