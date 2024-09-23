CREATE TRIGGER trg_CheckOverlappingPlacements ON Placement
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Inserted I
        JOIN Placement P ON I.gradID = P.gradID AND I.placementCode != P.placementCode
        WHERE (I.emplStart BETWEEN P.emplStart AND P.emplFinish)
           OR (I.emplFinish BETWEEN P.emplStart AND P.emplFinish)
           OR (P.emplStart BETWEEN I.emplStart AND I.emplFinish)
           OR (P.emplFinish BETWEEN I.emplStart AND I.emplFinish)
    )
    BEGIN
        RAISERROR('Το δοθέν διάστημα εργασίας συμπίτει χρονολογιακά με ένα ήδη υπάρχον διάστημα εργασίας του απόφοιτου!', 16, 1)
        ROLLBACK TRANSACTION
    END
END