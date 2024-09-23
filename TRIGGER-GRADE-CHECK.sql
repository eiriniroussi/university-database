CREATE TRIGGER check_grade ON Degree
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Inserted I
        WHERE I.grade < 5.00 OR I.grade > 10.00
    )
    BEGIN
        RAISERROR('Άκυρος βαθμός πτυχίου: Για να είναι έγκυρος ο βαθμός θα πρέπει να είναι μεταξύ του 05.00 και 10.00', 16, 1)
        ROLLBACK TRANSACTION
    END
END