SET VERIFY ON

SET ECHO ON

REM Queries

COLUMN FNAME FORMAT A6
COLUMN LNAME FORMAT A8
COLUMN CNO FORMAT A4
COLUMN CNAME FORMAT A15
COLUMN CT FORMAT A2
COLUMN DUR FORMAT A3
COLUMN MNO FORMAT A6
COLUMN MNAME FORMAT A15
COLUMN MK	FORMAT 9999
COLUMN RMK FORMAT 9999


SELECT 	s.First_Name "FName", s.Last_Name "LName", 
		s.Student_Course_ref.Course_No "CNo", s.Student_Course_ref.Course_Name "CName", s.Student_Course_ref.Course_Type "CT", s.Student_Course_ref.Duration "Dur",
		m.ModuleRef.Module_No "MNo", m.ModuleRef.Module_Name "MName", 
		sm.StudentModulesRef.Mark "Mk", sm.StudentModulesRef.Resit_Mark "RMk"
	FROM Student_tab_Sub s, TABLE (s.Study)m, TABLE (s.Marks)sm
	WHERE s.Student_Course_ref.Course_Type = 'P' 
/

