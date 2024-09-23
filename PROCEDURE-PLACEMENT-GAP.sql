/* Έυρεση των αποφοίτων που έχουν κενό διάστημα μεταξύ των εργασιών τους και ποιό είναι το διάστημα αυτό σε ημέρες*/
USE GraduateInfo
GO

CREATE PROCEDURE EmploymentGap
AS
BEGIN
    WITH OrderedPlacements AS (
        SELECT 
            gradID, 
            emplStart, 
            emplFinish, 
            ROW_NUMBER() OVER (PARTITION BY gradID ORDER BY emplStart) AS Rnumber
        FROM 
            Placement
    )
    SELECT 
        P1.gradID,
        G.fName,
        G.lName,
        P1.emplFinish AS EndOfPrevPlacement,
        P2.emplStart AS StartOfNextPlacement,
        DATEDIFF(day, P1.emplFinish, P2.emplStart) AS GapDays
    FROM 
        OrderedPlacements P1
        INNER JOIN OrderedPlacements P2 ON P1.gradID = P2.gradID AND P1.Rnumber = P2.Rnumber - 1
        INNER JOIN Graduate G ON P1.gradID = G.gradID
    WHERE 
        P1.emplFinish IS NOT NULL AND P2.emplStart > P1.emplFinish;
END