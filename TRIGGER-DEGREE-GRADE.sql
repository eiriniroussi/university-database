--Έλεγχος βαθμού ως προς την μορφή του (συνολικός αριθμός ψηφίων) πριν την εισαγωγή του στον πίνακα.
CREATE TRIGGER trg_CheckGradeFormat ON Degree
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Inserted I
        WHERE LEN(CAST(I.grade AS VARCHAR(10))) > 5 OR I.grade <> ROUND(I.grade, 2)
    )
    BEGIN
        RAISERROR('Άκυρη μορφή βαθμού πτυχίου. Ο βαθμός θα πρέπει να είναι στο σύνολο το πολύ 4 ψηφία και με μέχρι 2 ψηφία στο δεκαδικό τους μέρος.', 16, 1)
        ROLLBACK TRANSACTION
    END
END