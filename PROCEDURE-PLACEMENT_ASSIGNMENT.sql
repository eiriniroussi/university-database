/* Ανάθεση στοιχείων εργασίας σε κάποιον απόφοιτο*/
USE GraduateInfo
GO

CREATE PROCEDURE PlacementAddition
    @placementCode INT,
    @placementTitle VARCHAR(100),
    @emplStart DATE,
    @emplFinish DATE,
    @careerID INT,
    @companyID INT,
    @gradID INT
AS
BEGIN
    INSERT INTO Placement (placementCode, placementTitle, emplStart, emplFinish, careerID, companyID, gradID)
    VALUES (@placementCode, @placementTitle, @emplStart, @emplFinish, @careerID, @companyID, @gradID);
END