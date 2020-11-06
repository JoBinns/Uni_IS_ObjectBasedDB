SET VERIFY ON

SET ECHO ON

REM Queries

COLUMN FNAME FORMAT A9
COLUMN LNAME FORMAT A9
COLUMN DEPT FORMAT A15
COLUMN STREET FORMAT A14
COLUMN CITY FORMAT A8
COLUMN REGION FORMAT A6
COLUMN PCode FORMAT A5


SELECT 	s.Student_No "ID", s.First_Name "FName", s.Last_Name "LName", s.Dept_ref.Dept_Name "Dept",
		s.HAddress_ref.Street "Street", s.HAddress_ref.City "City", s.HAddress_ref.Region "Region", s.HAddress_ref.Postcode "PCode" 
	FROM Student_tab_Sub s
	UNION
SELECT 	f.Staff_No, f.First_Name, f.Last_Name, f.Dept_ref.Dept_Name,
		f.HAddress_ref.Street "Street", f.HAddress_ref.City "City", f.HAddress_ref.Region "Region", f.HAddress_ref.Postcode "PCode" 
	FROM Faculty_tab_Sub f
	ORDER BY "ID"
/
