/* Έυρεση ποσοστού κατηγορίας απασχόλησης ανά τμήμα του Πανεπιστημίου*/
USE GraduateInfo
GO

CREATE PROCEDURE EmploymentCategoriesByDepartment
AS
BEGIN
    SELECT 
        Dept.deptName,
        C.categoryTitle,
         ROUND(CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY Dept.deptID) AS DECIMAL(10,2)), 2) AS Percentage
    FROM 
        Department Dept
        JOIN Degree D ON Dept.deptID = D.deptID
        JOIN Graduate G ON D.gradID = G.gradID
        JOIN Placement P ON G.gradID = P.gradID
        JOIN CareerCategory C ON P.careerID = C.careerID
    GROUP BY 
        Dept.deptID, Dept.deptName, C.categoryTitle
    ORDER BY 
        Dept.deptName, Percentage;
END

