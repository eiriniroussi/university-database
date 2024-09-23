USE GraduateInfo

CREATE INDEX idx_gradID_GraduateDegree ON Degree(gradID);

CREATE INDEX idx_gradID_GraduatePlacement ON Placement(gradID);

CREATE INDEX idx_deptID_on_Degree ON Degree(deptID);