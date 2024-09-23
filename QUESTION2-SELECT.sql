USE GraduateInfo

/*A) Εμφάνιση των αποφοίτων και των τμημάτων που αποφοίτησαν με έτος εγγραφής και αποφοίτησης ταξινομημένα αλφαβητικά κατά επίθετο*/

SELECT
   G.fName,
   G.lName,
   D.gradYear,
   D.regYear,
   Dept.deptName
FROM
   Graduate G
JOIN
   Degree D ON G.gradID = D.gradID
JOIN
   Department Dept ON D.deptID = Dept.deptID
ORDER BY
   G.lName;
 
/*B) Εμφάνιση των φοιτητών και των θέσεων εργασίας που έχουν ταξινομημένα κατά φθίνουσα σειρά διάρκειας απασχόλησης σε διάρκεια ημερών*/

SELECT
   G.fName,
   G.lName,
   P.placementTitle,
   P.emplStart,
   P.emplFinish,
   DATEDIFF(day, P.emplStart, P.emplFinish) as PlacementDurationDays
FROM
   Graduate G
JOIN
   Placement P ON G.gradID = P.gradID
ORDER BY
   PlacementDurationDays DESC;

/*Γ) Εμφάνιση των στοιχείων των αποφοίτων, του τμήματος που αποφοίτησαν, ημερομηνίες εγγραφής και αποφοίτησης του απόφοιτου καθώς και ιστορικό εργασίας τους ταξινομημένα κατά αλφαβητική σειρά επιθέτου και ονόματος*/

SELECT
   Gr.fName AS GraduateFirstName,
   Gr.lName AS GraduateLastName,
   D.gradYear,
   D.regYear,
   Dept.deptName AS DepartmentName,
   P.placementTitle,
   P.emplStart,
   P.emplFinish,
   C.companyName AS CompanyName
FROM
   Graduate Gr
JOIN
   Degree D ON Gr.gradID = D.gradID
JOIN
   Department Dept ON D.deptID = Dept.deptID
JOIN
   Placement P ON Gr.gradID = P.gradID
JOIN
   Company C ON P.companyID = C.companyID
ORDER BY
   Gr.lName, Gr.fName;

/*Δ) Εμφάνιση του πλήθους των αποφοίτων ανά τμήμα του πανεπιστημίου*/

SELECT
   Dept.deptName,
   COUNT(Gr.gradID) AS NumberOfGraduates
FROM
   Department Dept
JOIN
   Degree D ON Dept.deptID = D.deptID
JOIN
   Graduate Gr ON D.gradID = Gr.gradID
GROUP BY
   Dept.deptName;


/*Ε) Εμφάνιση της υψηλότερης βαθμολογίας ανά τμήμα σε προπτυχιακό επίπεδο.*/

SELECT
   Dept.deptName,
   MAX(D.grade) AS HighestGrade
FROM
   Degree D
JOIN
   Department Dept ON D.deptID = Dept.deptID
WHERE
   D.studyID = 1
GROUP BY
   Dept.deptName;
