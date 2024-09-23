/*1) Να διατυπωθούν όλες οι απαραίτητες εντολές εισαγωγής (INSERT) διαγραφής (DELETE) και τροποποίησης (UPDATE) στους πίνακες*/

/*Παραδείγματα εισαγωγής δεδομένων (INSERT):*/

INSERT INTO Graduate(fName,lName,studNumber,fathersName,birthDate,email) VALUES (N'Πασχαλιά', N'Κυρίτση', 74469963, N'Πάρις', '1992-08-13',  'chrysafenia.mpika@maurikakis-karkanaki.com');

INSERT INTO Department(deptName,facultyID) VALUES (N'Οικονομικής Επιστήμης', 1);

INSERT INTO Company(companyName,companyLocation) VALUES ('Media Markt', N'Αθήνα');

INSERT INTO Faculty (fName) VALUES ( N'Τεχνολογιών Πληροφορικής και Επικοινωνιών');

INSERT INTO Placement (placementCode, placementTitle, emplStart, emplFinish, gradID, careerID, companyID) VALUES (293595169, 'Project Manager','2017-03-05','2019-08-01',21543371, 1,49)

INSERT INTO CareerCategory(categoryTitle) VALUES ( N'Οικονομικά');

INSERT INTO StudyLevel(studyLevel) VALUES ( N'Προπτυχιακό');

/*Παράδειγμα  διαγραφής δεδομένων (DELETE):*/

DELETE FROM Degree
WHERE gradYear > 2024; /*Invalid inputs*/

DELETE FROM Graduate
WHERE birthDate < '1980-01-01'; /*Remove old Graduates*/

DELETE FROM Company
WHERE companyName = 'Media Markt';

DELETE FROM CareerCategory
WHERE careerID = 9;

DELETE FROM Degree
WHERE regYear < 2000; /*Remove old Degree records*/

DELETE FROM Placement
WHERE emplStart < '2000-01-01'; /*Remove old Placement records*/

SELECT * FROM Graduate

/*Παράδειγμα τροποποίησης δεδομένων (UPDATE):*/

UPDATE Degree
SET grade = 7.5
WHERE gradID = 1


UPDATE Graduate
SET email = 'theo@gmail.com'
WHERE gradID = 5

UPDATE Placement
SET emplFinish = '2024-01-27'
WHERE gradID = 92

UPDATE CareerCategory
SET categoryTitle = 'Marketing'
WHERE careerID = 2

UPDATE Company
SET companyLocation = N'Αθήνα'
WHERE companyID = 4


