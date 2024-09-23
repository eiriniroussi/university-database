CREATE TRIGGER trg_CheckGraduationDate ON Degree
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Inserted I
        JOIN Graduate G ON I.gradID = G.gradID
        WHERE YEAR(I.gradYear) - YEAR(G.birthDate) < 18
    )
    BEGIN
        RAISERROR('Η χρονολογία αποφοίτησης δεν είναι έγκυρη! Ένας απόφοιτος πρέπει να είναι μεγαλύτερος από 18 ετών κατά το έτος ορκωμοσίας του.', 16, 1)
        ROLLBACK TRANSACTION
    END
END