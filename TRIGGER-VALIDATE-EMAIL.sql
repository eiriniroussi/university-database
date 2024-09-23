CREATE TRIGGER trg_ValidateEmailFormat ON Graduate
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Inserted I
        WHERE CHARINDEX('@', I.email) <= 1 
           OR CHARINDEX('@', I.email) = LEN(I.email)
           OR CHARINDEX('@', I.email) = 0
    )
    BEGIN
        RAISERROR('Μη έγκυρη μορφή email. To email πρέπει να περιέχει τον χαρακτήρα "@" και να μην βρίσκεται ούτε αρχή ούτε στο τέλος της λέξης', 16, 1)
        ROLLBACK TRANSACTION
    END
END