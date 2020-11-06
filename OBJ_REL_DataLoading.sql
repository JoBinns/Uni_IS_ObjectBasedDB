SET VERIFY ON

SET ECHO ON

	
REM Oject-Relational Database Loading 
REM creating Department objects without Courses, Staff, Address and Chair

INSERT INTO Department_tab
	VALUES ('Applied Sciences', 01912437900, 01912274274, 'hs.enquiry@ais.ac.ar', Course_nt_type(), Person_nt_typ(), NULL, NULL, Chair_nt_type());
INSERT INTO Department_tab
	VALUES ('Computer and Information Sciences', 01912427866, 01912290943, 'cis.enquiry@ais.ac.ar', Course_nt_type(), Person_nt_typ(), NULL, NULL, Chair_nt_type()); 
INSERT INTO Department_tab
	VALUES ('Sport Exercise and Rehabilitation', 01912458723, 01912219065, 'ser.enquiry@ais.ac.ar', Course_nt_type(), Person_nt_typ(), NULL, NULL, Chair_nt_type());

REM creating Course objects without Staff, Modules and Students
REM to populate the Department relationship at the same time

INSERT INTO Course_tab
	VALUES ('MF94', 'Criminology and Forensic Science BSc Hons', 'U', '4YRS', 'Full time', 360, (select REF (d) from Department_tab d
		where d.Dept_Name = 'Applied Sciences'), NULL, Module_nt_type(), Student_nt_typ());
INSERT INTO Course_tab
	VALUES ('B940', 'Biomedical Science BSc Hons', 'U', '3YRS', 'Full time', 360, (select REF (d) from Department_tab d
		where d.Dept_Name = 'Applied Sciences'), NULL, Module_nt_type(), Student_nt_typ());		
INSERT INTO Course_tab
	VALUES ('AI64', 'Artifical Intelligence MSc', 'P', '12MTHS', 'Full time', 180, (select REF (d) from Department_tab d
		where d.Dept_Name = 'Computer and Information Sciences'), NULL, Module_nt_type(), Student_nt_typ());
INSERT INTO Course_tab
	VALUES ('AC78', 'Advanced Computer Science MSc', 'P', '12MTHS', 'Full time', 180, (select REF (d) from Department_tab d
		where d.Dept_Name = 'Computer and Information Sciences'), NULL, Module_nt_type(), Student_nt_typ()); 	
INSERT INTO Course_tab
	VALUES ('AC88', 'Advanced Computer Science MSc', 'P', '2YRS', 'Part time', 180, (select REF (d) from Department_tab d
		where d.Dept_Name = 'Computer and Information Sciences'), NULL, Module_nt_type(), Student_nt_typ()); 
INSERT INTO Course_tab
	VALUES ('CX61', 'Sport Coaching BSc', 'U', '3YRS', 'Distance Learning', 360, (select REF (d) from Department_tab d
		where d.Dept_Name = 'Sport Exercise and Rehabilitation'), NULL, Module_nt_type(), Student_nt_typ());	
INSERT INTO Course_tab
	VALUES ('CE21', 'Clinical Exercise MSc', 'P', '18MTHS', 'Part time', 180, (select REF (d) from Department_tab d
		where d.Dept_Name = 'Sport Exercise and Rehabilitation'), NULL, Module_nt_type(), Student_nt_typ());
INSERT INTO Course_tab
	VALUES ('PR45', 'Clinical Exercise Physiology MSc', 'P', '12MTHS', 'Full time', 180, (select REF (d) from Department_tab d
		where d.Dept_Name = 'Sport Exercise and Rehabilitation'), NULL, Module_nt_type(), Student_nt_typ());

REM populate Department_tab.Courses which is a nested table of type Course_nt_type

INSERT INTO TABLE (SELECT d.Courses FROM Department_tab d WHERE d.DEPT_NAME = 'Applied Sciences')
	SELECT REF (c) FROM Course_tab c WHERE c.COURSE_DEPT_ref.DEPT_NAME = 'Applied Sciences';
INSERT INTO TABLE (SELECT d.Courses FROM Department_tab d WHERE d.DEPT_NAME = 'Computer and Information Sciences')
	SELECT REF (c) FROM Course_tab c WHERE c.COURSE_DEPT_ref.DEPT_NAME = 'Computer and Information Sciences';
INSERT INTO TABLE (SELECT d.Courses FROM Department_tab d WHERE d.DEPT_NAME = 'Sport Exercise and Rehabilitation')
	SELECT REF (c) FROM Course_tab c WHERE c.COURSE_DEPT_ref.DEPT_NAME = 'Sport Exercise and Rehabilitation';	
		
REM creating Module objects without Tutors, Courses, Lecturers and Students		

INSERT INTO Module_tab
	VALUES ('AP0400', 'Practical Skills in Forensic Science', '1', 20, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('AP0411', 'Introductory Pathological Sciences', '1', 40, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('AP0408', 'Anatomy and Physiology', '1', 20, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('CR6007', 'Mentally Disordered Offenders', '4', 20, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('CR6002', 'Contemporary Policing and Toxicology', '4', 20, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ());  
INSERT INTO Module_tab
	VALUES ('AP0601', 'Complex Casework', '4', 20, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('AP0504', 'Drugs and Toxicology', '2', 20, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('CR5006', 'Race, Crime and Justice', '2', 20, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('AP0511', 'Molecular Biology and Genetics', '2', 20, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('AP0536', 'Study Abroad', '3', 120, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('AP0610', 'Genomics', '3', 20, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('AP0607', 'Molecular Cell Interactions', '3', 20, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('KV7003', 'AI and Digital Technology', 'M', 40, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('KF7010', 'Programme Design and Implementation', 'M', 40, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('KV7004', 'AI Studio', 'M', 40, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('KV7005', 'Intelligent User Interface', 'M', 60, 	NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('SP0475', 'Examining Sport Participation', '1', 40, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(),Student_nt_typ() ); 
INSERT INTO Module_tab
	VALUES ('SP0477', 'Professional Skills for Sport', '1', 40, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(),Student_nt_typ() ); 
INSERT INTO Module_tab
	VALUES ('SD0412', 'Introduction to Coaching Science', '1', 20, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(),Student_nt_typ() ); 
INSERT INTO Module_tab
	VALUES ('SP5010', 'Coaching Skills and Practice', '2', 40, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('SP5012', 'Sport Research in Practice', '2', 60, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('SP6008', 'Talent ID and High Performance Coaching', '3', 60, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('SP6033', 'Applied Coaching of Individual Sports in an Educational Setting', '3', 40, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(),Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('SP0739', 'Epidemiology of Health Disorders and Special Populations', '3', 60, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('SP0738', 'Research Methods', 'M', 80, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(),Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('SP0740', 'Epidemiology, Aetiology and Pathology of Health Disorders and Special Populations', 'M', 60, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(),Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('PY0756', 'Exercise Psychology', 'M', 40, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(),Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('SP0733', 'Sport and Exercise Science Dissertation', 'M', 60,  NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('SP1844', 'Clinical Competencies and Assessment Skills', 'M', 40, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('SP0732', 'Exercise Prescription for Health Disorders and Special Populations', 'M', 40, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ());  
INSERT INTO Module_tab
	VALUES ('KF7011', 'Object Orientated Design', 'M', 40, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('KF7023', 'Computer Networks and Operating Systems', 'M', 40, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 
INSERT INTO Module_tab
	VALUES ('KF7028', 'Research Methods and Proposal', 'M', 60, NULL, Course_nt_type(), Teaching_nt_type(), Student_Modules_nt_type(), Student_nt_typ()); 

REM populate nested table Courses of type Course_nt_type in Module_tab

INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'AP0400')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('MF94');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'AP0411')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('MF94', 'B940');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'AP0408')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('MF94', 'B940');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'CR6007')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('MF94');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'CR6002')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('MF94');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'AP0601')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('MF94');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'AP0504')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('MF94', 'B940');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'CR5006')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('MF94');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'AP0511')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('MF94', 'B940');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'AP0536')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('MF94');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'AP0610')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('MF94', 'B940');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'AP0607')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('MF94', 'B940');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'KV7003')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('AI64');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'KF7010')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('AI64', 'AC78', 'AC88');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'KV7004')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('AI64');		
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'KV7005')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('AI64');
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'SP0475')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('CX61');		
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'SP0477')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('CX61');			
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'SD0412')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('CX61');			
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'SP5010')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('CX61');			
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'SP5012')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('CX61');			
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'SP6008')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('CX61');			
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'SP6033')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('CX61');			
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'SP0739')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('CX61');	
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'SP0738')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('CE21');	
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'SP0740')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('CE21');	
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'PY0756')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('CE21', 'PR45');	
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'SP0733')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('PR45');	
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'SP1844')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('PR45');	
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'SP0732')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('PR45');	
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'KF7011')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('AC78', 'AC88');		
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'KF7023')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('AC78', 'AC88');		
INSERT INTO TABLE (SELECT m.Courses FROM Module_tab m WHERE m.MODULE_NO = 'KF7028')
		SELECT REF (c) FROM Course_tab c WHERE c.COURSE_NO IN ('AC78', 'AC88');		
	
REM populate nested table Modules of type Module_nt_type in Course_tab

INSERT INTO TABLE (SELECT c.Modules FROM Course_tab c WHERE c.COURSE_NO = 'MF94')
	SELECT REF (m) FROM Module_tab m WHERE m.MODULE_NO IN ('AP0400', 'AP0411', 'AP0408', 'CR6007', 'CR6002', 'AP0601', 'AP0504', 'CR5006', 'AP0511',  'AP0536', 'AP0610', 'AP0607');
INSERT INTO TABLE (SELECT c.Modules FROM Course_tab c WHERE c.COURSE_NO = 'B940')
	SELECT REF (m) FROM Module_tab m WHERE m.MODULE_NO IN ('AP0408', 'AP0411', 'AP0511', 'AP0504', 'AP0610', 'AP0607');
INSERT INTO TABLE (SELECT c.Modules FROM Course_tab c WHERE c.COURSE_NO = 'AI64')
	SELECT REF (m) FROM Module_tab m WHERE m.MODULE_NO IN ('KV7003', 'KF7010', 'KV7004', 'KV7005');
INSERT INTO TABLE (SELECT c.Modules FROM Course_tab c WHERE c.COURSE_NO = 'AC78')
	SELECT REF (m) FROM Module_tab m WHERE m.MODULE_NO IN ('KF7010', 'KF7011', 'KF7023', 'KF7028');
INSERT INTO TABLE (SELECT c.Modules FROM Course_tab c WHERE c.COURSE_NO = 'AC88')
	SELECT REF (m) FROM Module_tab m WHERE m.MODULE_NO IN ('KF7010', 'KF7011', 'KF7023', 'KF7028');
INSERT INTO TABLE (SELECT c.Modules FROM Course_tab c WHERE c.COURSE_NO = 'CX61')
	SELECT REF (m) FROM Module_tab m WHERE m.MODULE_NO IN ('SP0475', 'SP0477', 'SD0412', 'SP5010', 'SP5012', 'SP6008', 'SP6033', 'SP0739');
INSERT INTO TABLE (SELECT c.Modules FROM Course_tab c WHERE c.COURSE_NO = 'CE21')
	SELECT REF (m) FROM Module_tab m WHERE m.MODULE_NO IN ('SP0738','SP0740', 'PY0756');
INSERT INTO TABLE (SELECT c.Modules FROM Course_tab c WHERE c.COURSE_NO = 'PR45')
	SELECT REF (m) FROM Module_tab m WHERE m.MODULE_NO IN ('PY0756', 'SP0733', 'SP1844', 'SP0732');
								
REM creating Faculty object without Manager, Course leaders, Module tutors, Students, Module lecturers, Department chair, Qualifications

INSERT INTO Faculty_tab_Sub
	VALUES ('christine.edwards@ais.ac.ar', 'Dr', 'Christine', 'Francis', 'Edwards', '14-MAR-1972', 'F', '05-JAN-1996', 07024012501, (select REF (d) from Department_tab d where d.DEPT_NAME = 'Applied Sciences'), NULL, NULL,
			'AAS9624', 'City Campus Northumberland Building', 101, 479, 48000, 'Professor Matthew Hulmes', Qualifications_varray_type (Qualifications_t ('BSc in Chemistry', 1993, 'University of Manchester'), 
			Qualifications_t ('MSc in Organic Chemistry', 1994, 'University of Liverpool'), Qualifications_t ('PhD in Organometallic Chemistry and Catalysis', 1996, 'University of Liverpool')), 
			Course_nt_type(), Module_nt_type(), Student_nt_typ(), Teaching_nt_type(), Chair_nt_type()); 
INSERT INTO Faculty_tab_Sub
	VALUES ('matthew.hulmes@ais.ac.ar', 'Professor', 'Matthew', NULL, 'Hulmes', '08-FEB-1960', 'M', '23-SEP-1988', 07787542310,(select REF (d) from Department_tab d where d.DEPT_NAME = 'Applied Sciences'), NULL, NULL,
			'AAS8241', 'Beach Campus Sandy Building', 222, 832, 72000, NULL, Qualifications_varray_type (Qualifications_t ('MSc in Organic Chemistry', 1982, 'Imperial College London'),
			Qualifications_t ('PhD DIC', 1987, 'Imperial College London')), Course_nt_type(), Module_nt_type(), Student_nt_typ(), Teaching_nt_type(), Chair_nt_type()); 
INSERT INTO Faculty_tab_Sub
	VALUES ('alex.brayfield@ais.ac.ar', 'Dr', 'Alex', NULL, 'Brayfield', '27-MAY-1988', 'M', '20-SEP-2019', 07976205573, (select REF (d) from Department_tab d where d.DEPT_NAME = 'Computer and Information Sciences'), NULL, NULL,
			'ACS0379', 'Ellison Building West Coast', 731, 945, 36000, 'Dr Ali Chandran', Qualifications_varray_type (Qualifications_t ('BSc in Computer Science', 2009, 'University of Reading'), 
			Qualifications_t ('MSc in Data Science', 2010, 'University of Warwick'), Qualifications_t ('PhD in DNA Computing', 2015, 'University of Warwick')), Course_nt_type(), Module_nt_type(),
			Student_nt_typ(), Teaching_nt_type(), Chair_nt_type()); 
INSERT INTO Faculty_tab_Sub
	VALUES ('ali.chandran@ais.ac.ar', 'Dr', 'Ali', NULL, 'Chandran', '15-APR-1956', 'M', '27-APR-1986', 07999462107, (select REF (d) from Department_tab d where d.DEPT_NAME = 'Computer and Information Sciences'), NULL, NULL,
			'ACS2950', 'Ellison Building West Coast', 735, 789, 58000, NULL, Qualifications_varray_type (Qualifications_t ('MEng in Mechanical Engineering', 1978, 'University of Bath'), 
			Qualifications_t ('PhD in Mechanical Engineering', 1983, 'University of Lincoln')), Course_nt_type(), Module_nt_type(), Student_nt_typ(), Teaching_nt_type(), Chair_nt_type()); 
INSERT INTO Faculty_tab_Sub
	VALUES ('jay.patterson@ais.ac.ar', 'Mr', 'Jay', 'Iain', 'Patterson', '03-OCT-1979', 'M', '23-SEP-2009', 07733350012, (select REF (d) from Department_tab d where d.DEPT_NAME = 'Computer and Information Sciences'), NULL, NULL,
			'ACS1158', 'Rudolph Centre Stable Block', 203, 667, 34000, 'Dr Ali Chandran', Qualifications_varray_type (Qualifications_t ('BSc in Computer Science', 2000, 'University of Sheffield'),
			Qualifications_t ('MSc in Distance Learning', 2006, 'University of Manchester')), Course_nt_type(), Module_nt_type(), Student_nt_typ(), Teaching_nt_type(), Chair_nt_type()); 
INSERT INTO Faculty_tab_Sub
	VALUES ('karen.benson@ais.ac.ar', 'Dr', 'Karen', 'Jane', 'Benson', '19-SEP-1983', 'F', '22-APR-2010', 07024312856, (select REF (d) from Department_tab d where d.DEPT_NAME = 'Sport Exercise and Rehabilitation'), NULL, NULL,
			'ASE3552', 'Arena Central Courseway', 602, 482, 43000, 'Professor Elaine Campbell', Qualifications_varray_type (Qualifications_t ('BSc in Applied Sports Science', 2004, 'University of Edinburgh'), 
			Qualifications_t ('MSc in Physiotherapy', 2005, 'University of Birmingham'), Qualifications_t ('PhD in Biomechanics', 2010, 'University of Birmingham')), Course_nt_type(), Module_nt_type(),
			Student_nt_typ(), Teaching_nt_type(), Chair_nt_type()); 
INSERT INTO Faculty_tab_Sub
	VALUES ('darren.levison@ais.ac.ar', 'Dr', 'Darren', 'Jason', 'Levison', '28-NOV-1966', 'M', '20-SEP-2000', 07782113784, (select REF (d) from Department_tab d where d.DEPT_NAME = 'Sport Exercise and Rehabilitation'), NULL, NULL,
			'ASE0075', 'Arena Central Courseway', 131, 559, 50000, 'Professor Elaine Campbell', Qualifications_varray_type (Qualifications_t ('MSc in Sport and Exercise Sciences', 1988, 'University of Sunderland'),
			Qualifications_t ('PhD in Physiotherapy', 1995, 'University of Teeside')), Course_nt_type(), Module_nt_type(), Student_nt_typ(), Teaching_nt_type(), Chair_nt_type()); 
INSERT INTO Faculty_tab_Sub
	VALUES ('elaine.campbell@ais.ac.ar', 'Professor', 'Elaine', 'Mary', 'Campbell', '18-MAR-1962', 'F', '26-APR-1995', 07971200365, (select REF (d) from Department_tab d where d.DEPT_NAME = 'Sport Exercise and Rehabilitation'), NULL, NULL,
			'ASE5566', 'Armstrong Building Central Park', 226, 888, 68000, NULL, Qualifications_varray_type (Qualifications_t ('BSc in Sport and Exercise Science', 1983, 'University of Kent'),
			Qualifications_t ('MSc in Sport and Exercise Physiology', 1985, 'University of Liverpool'), Qualifications_t ('PhD in Exercise and Rehabilitation', 1992, 'Brunel University')), Course_nt_type(), Module_nt_type(),
			Student_nt_typ(), Teaching_nt_type(), Chair_nt_type()); 

REM populate Department_tab.staff_students which is a nested table of type Person_nt_typ	

INSERT INTO TABLE (SELECT d.Staff_Students from Department_tab d WHERE d.DEPT_NAME = 'Applied Sciences')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.DEPT_ref.DEPT_NAME = 'Applied Sciences';		
INSERT INTO TABLE (SELECT d.Staff_Students from Department_tab d WHERE d.DEPT_NAME = 'Computer and Information Sciences')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.DEPT_ref.DEPT_NAME = 'Computer and Information Sciences';
INSERT INTO TABLE (SELECT d.Staff_Students from Department_tab d WHERE d.DEPT_NAME = 'Sport Exercise and Rehabilitation')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.DEPT_ref.DEPT_NAME = 'Sport Exercise and Rehabilitation';

REM Link Faculty to Course by populating Course_Staff_ref 

UPDATE Course_tab
	SET Course_Staff_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS8241')
	WHERE COURSE_NO = 'MF94'; 
UPDATE Course_tab
	SET Course_Staff_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS9624')
	WHERE COURSE_NO = 'B940'; 
UPDATE Course_tab
	SET Course_Staff_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS0379')
	WHERE COURSE_NO = 'AI64'; 
UPDATE Course_tab
	SET Course_Staff_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS2950')
	WHERE COURSE_NO = 'AC78';
UPDATE Course_tab
	SET Course_Staff_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS1158')
	WHERE COURSE_NO = 'AC88';
UPDATE Course_tab
	SET Course_Staff_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE3552')
	WHERE COURSE_NO = 'CX61';
UPDATE Course_tab
	SET Course_Staff_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE0075')
	WHERE COURSE_NO = 'CE21';
UPDATE Course_tab
	SET Course_Staff_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE5566')
	WHERE COURSE_NO = 'PR45';
	
REM Link Faculty to Modules by populating Tutors_ref

UPDATE Module_tab
	SET Tutors_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS9624')
	WHERE MODULE_NO IN ('AP0400', 'AP0411', 'CR6007', 'AP0504', 'CR5006', 'AP0511', 'AP0607'); 
UPDATE Module_tab	
	SET Tutors_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS8241')
	WHERE MODULE_NO IN('AP0408', 'CR6002', 'AP0601', 'AP0536', 'AP0610');
UPDATE Module_tab	
	SET Tutors_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS0379')	
	WHERE MODULE_NO IN ('KV7003', 'KV7004'); 
UPDATE Module_tab	
	SET Tutors_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 	'ACS2950')
	WHERE MODULE_NO IN ('KF7010', 'KV7005', 'KF7011', 'KF7023', 'KF7028');
UPDATE Module_tab	
	SET Tutors_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE3552')
	WHERE MODULE_NO IN ('SP0475', 'SP6008', 'SP6033', 'PY0756');
UPDATE Module_tab	
	SET Tutors_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 	'ASE0075')
	WHERE MODULE_NO IN ('SP0477', 'SD0412', 'SP5010', 'SP0739', 'SP0740', 'SP0732');
UPDATE Module_tab	
	SET Tutors_ref = (SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE5566')	
	WHERE MODULE_NO IN ('SP5012', 'SP0738', 'SP0733', 'SP1844');
	
REM populate Faculty_tab_Sub.Courses_led with a nested table of type Course_nt_type

INSERT INTO TABLE (SELECT f.Courses_led FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS9624')
	SELECT REF (c) FROM Course_tab c WHERE c.Course_Staff_ref.STAFF_NO = 'AAS9624';
INSERT INTO TABLE (SELECT f.Courses_led FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS8241')
	SELECT REF (c) FROM Course_tab c WHERE c.Course_Staff_ref.STAFF_NO = 'AAS8241';	
INSERT INTO TABLE (SELECT f.Courses_led FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS0379')
	SELECT REF (c) FROM Course_tab c WHERE c.Course_Staff_ref.STAFF_NO = 'ACS0379';	
INSERT INTO TABLE (SELECT f.Courses_led FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS2950')
	SELECT REF (c) FROM Course_tab c WHERE c.Course_Staff_ref.STAFF_NO = 'ACS2950';	
INSERT INTO TABLE (SELECT f.Courses_led FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS1158')
	SELECT REF (c) FROM Course_tab c WHERE c.Course_Staff_ref.STAFF_NO = 'ACS1158';
INSERT INTO TABLE (SELECT f.Courses_led FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE3552')
	SELECT REF (c) FROM Course_tab c WHERE c.Course_Staff_ref.STAFF_NO = 'ASE3552';	
INSERT INTO TABLE (SELECT f.Courses_led FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE0075')
	SELECT REF (c) FROM Course_tab c WHERE c.Course_Staff_ref.STAFF_NO = 'ASE0075';	
INSERT INTO TABLE (SELECT f.Courses_led FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE5566')
	SELECT REF (c) FROM Course_tab c WHERE c.Course_Staff_ref.STAFF_NO = 'ASE5566';	
	
REM populate Faculty_tab_Sub.Modules_tutored with a nested table of type Module_nt_type

INSERT INTO TABLE (SELECT f.Modules_tutored FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS9624')
	SELECT REF (m) FROM Module_tab m WHERE m.Tutors_ref.STAFF_NO = 'AAS9624';
INSERT INTO TABLE (SELECT f.Modules_tutored FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS8241')
	SELECT REF (m) FROM Module_tab m WHERE m.Tutors_ref.STAFF_NO = 'AAS8241';	
INSERT INTO TABLE (SELECT f.Modules_tutored FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS0379')
	SELECT REF (m) FROM Module_tab m WHERE m.Tutors_ref.STAFF_NO = 'ACS0379';	
INSERT INTO TABLE (SELECT f.Modules_tutored FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS2950')
	SELECT REF (m) FROM Module_tab m WHERE m.Tutors_ref.STAFF_NO = 'ACS2950';	
INSERT INTO TABLE (SELECT f.Modules_tutored FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE3552')
	SELECT REF (m) FROM Module_tab m WHERE m.Tutors_ref.STAFF_NO = 'ASE3552';	
INSERT INTO TABLE (SELECT f.Modules_tutored FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE0075')
	SELECT REF (m) FROM Module_tab m WHERE m.Tutors_ref.STAFF_NO = 'ASE0075';	
INSERT INTO TABLE (SELECT f.Modules_tutored FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE5566')
	SELECT REF (m) FROM Module_tab m WHERE m.Tutors_ref.STAFF_NO = 'ASE5566';		
																																																																																	
REM creating Teaching objects

INSERT INTO Teaching_tab
	VALUES (4, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'AAS9624'), (select REF (m) from Module_tab m where m.MODULE_NO = 'AP0400'));
INSERT INTO Teaching_tab
	VALUES (8, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'AAS9624'), (select REF (m) from Module_tab m where m.MODULE_NO = 'AP0411'));	
INSERT INTO Teaching_tab
	VALUES (2, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'AAS9624'), (select REF (m) from Module_tab m where m.MODULE_NO = 'CR6007'));
INSERT INTO Teaching_tab
	VALUES (10, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'AAS9624'), (select REF (m) from Module_tab m where m.MODULE_NO ='AP0610'));
INSERT INTO Teaching_tab
	VALUES (4, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'AAS9624'), (select REF (m) from Module_tab m where m.MODULE_NO ='AP0511'));
INSERT INTO Teaching_tab
	VALUES (4, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'AAS8241'), (select REF (m) from Module_tab m where m.MODULE_NO ='CR6002'));
INSERT INTO Teaching_tab
	VALUES (4, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'AAS8241'), (select REF (m) from Module_tab m where m.MODULE_NO ='AP0601'));
INSERT INTO Teaching_tab
	VALUES (4, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'AAS8241'), (select REF (m) from Module_tab m where m.MODULE_NO ='AP0504'));
INSERT INTO Teaching_tab
	VALUES (4, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'AAS8241'), (select REF (m) from Module_tab m where m.MODULE_NO ='AP0610'));
INSERT INTO Teaching_tab
	VALUES (4, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'AAS8241'), (select REF (m) from Module_tab m where m.MODULE_NO ='AP0408'));
INSERT INTO Teaching_tab
	VALUES (6, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'AAS8241'), (select REF (m) from Module_tab m where m.MODULE_NO ='CR5006'));
INSERT INTO Teaching_tab
	VALUES (3, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ACS0379'), (select REF (m) from Module_tab m where m.MODULE_NO ='KV7003'));
INSERT INTO Teaching_tab	
	VALUES (7, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ACS0379'), (select REF (m) from Module_tab m where m.MODULE_NO ='KV7004'));
INSERT INTO Teaching_tab	
	VALUES (4, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ACS2950'), (select REF (m) from Module_tab m where m.MODULE_NO ='KF7010'));
INSERT INTO Teaching_tab
	VALUES (8, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ACS1158'), (select REF (m) from Module_tab m where m.MODULE_NO ='KV7005'));
INSERT INTO Teaching_tab 
	VALUES (5, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ASE3552'), (select REF (m) from Module_tab m where m.MODULE_NO ='SP0475'));
INSERT INTO Teaching_tab	
	VALUES (6, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ASE3552'), (select REF (m) from Module_tab m where m.MODULE_NO ='SP0477'));
INSERT INTO Teaching_tab
	VALUES (8, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ASE3552'), (select REF (m) from Module_tab m where m.MODULE_NO ='SD0412'));
INSERT INTO Teaching_tab
	VALUES (4, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ASE0075'), (select REF (m) from Module_tab m where m.MODULE_NO ='SP5010'));
INSERT INTO Teaching_tab
	VALUES (6, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ASE3552'), (select REF (m) from Module_tab m where m.MODULE_NO ='SP5012'));
INSERT INTO Teaching_tab
	VALUES (4, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ASE0075'), (select REF (m) from Module_tab m where m.MODULE_NO ='SP5012'));
INSERT INTO Teaching_tab	
	VALUES (10, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ASE0075'), (select REF (m) from Module_tab m where m.MODULE_NO ='SP0739'));
INSERT INTO Teaching_tab
	VALUES (3, (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ASE0075'), (select REF (m) from Module_tab m where m.MODULE_NO ='PY0756'));

REM populate Module_tab.lecturers which is a nested table of type Teaching_nt_typ

INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'AP0400')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.MODULE_NO = 'AP0400';
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'AP0411')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.MODULE_NO = 'AP0411';
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'CR6007')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.MODULE_NO = 'CR6007';
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'AP0610')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.MODULE_NO = 'AP0610';
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'AP0511')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'AP0511';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'CR6002')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'CR6002';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'AP0601')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'AP0601';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'AP0504')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'AP0504';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'AP0408')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'AP0408';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'CR5006')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'CR5006';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'KV7003')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'KV7003';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'KV7004')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'KV7004';
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'KF7010')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'KF7010';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'KV7005')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'KV7005';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'SP0475')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'SP0475';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'SP0477')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'SP0477';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'SD0412')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'SD0412';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'SP5010')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'SP5010';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'SP5012')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'SP5012';	
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'SP0739')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'SP0739';
INSERT INTO TABLE (SELECT m.lecturers FROM Module_tab m WHERE m.MODULE_NO = 'PY0756')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff_Modules.Module_No = 'PY0756';

REM creating Chair objects

INSERT INTO Chair_tab
	VALUES ('20-SEP-2019', (select REF (d) from Department_tab d where d.DEPT_NAME = 'Applied Sciences'), (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'AAS8241'));
INSERT INTO Chair_tab
	VALUES ('20-SEP-2019', (select REF (d) from Department_tab d where d.DEPT_NAME = 'Computer and Information Sciences'), (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ACS0379'));
INSERT INTO Chair_tab
	VALUES ('20-SEP-2013', (select REF (d) from Department_tab d where d.DEPT_NAME = 'Sport Exercise and Rehabilitation'), (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ASE0075'));
INSERT INTO Chair_tab
	VALUES ('20-SEP-2019', (select REF (d) from Department_tab d where d.DEPT_NAME = 'Sport Exercise and Rehabilitation'), (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ASE3552'));

REM populate Department_tab.Chair which is a nested table of type Chair_nt_type

INSERT INTO TABLE (SELECT d.Chair FROM Department_tab d WHERE d.DEPT_NAME = 'Applied Sciences')
	SELECT REF (c) FROM Chair_tab c WHERE c.FK_Chair_Dept.DEPT_NAME = 'Applied Sciences';
INSERT INTO TABLE (SELECT d.Chair FROM Department_tab d WHERE d.DEPT_NAME = 'Computer and Information Sciences')
	SELECT REF (c) FROM Chair_tab c WHERE c.FK_Chair_Dept.DEPT_NAME = 'Computer and Information Sciences';	
INSERT INTO TABLE (SELECT d.Chair FROM Department_tab d WHERE d.DEPT_NAME = 'Sport Exercise and Rehabilitation')
	SELECT REF (c) FROM Chair_tab c WHERE c.FK_Chair_Dept.DEPT_NAME = 'Sport Exercise and Rehabilitation';	
	
REM populate Faculty_tab_Sub.Dept_chair which is a nested table of type Chair_nt_type

INSERT INTO TABLE (SELECT f.Dept_chair FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS8241')
	SELECT REF (c) FROM Chair_tab c WHERE c.FK_Chair_Professor.STAFF_NO = 'AAS8241';
INSERT INTO TABLE (SELECT f.Dept_chair FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS0379')
	SELECT REF (c) FROM Chair_tab c WHERE c.FK_Chair_Professor.STAFF_NO = 'ACS0379';
INSERT INTO TABLE (SELECT f.Dept_chair FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE0075')
	SELECT REF (c) FROM Chair_tab c WHERE c.FK_Chair_Professor.STAFF_NO = 'ASE0075';
INSERT INTO TABLE (SELECT f.Dept_chair FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE3552')
	SELECT REF (c) FROM Chair_tab c WHERE c.FK_Chair_Professor.STAFF_NO = 'ASE3552';		
	
REM creating Student object without Modules and Address

INSERT INTO Student_tab_Sub
	VALUES (Student_typ_Sub('a.lee@ais.ac.ar', 'Mr', 'Alex', 'Lee', 'Jennings', '05-MAR-2000', 'M', '22-SEP-2019', 07745782563, (select REF (d) from Department_tab d where d.DEPT_NAME = 'Applied Sciences'), NULL, NULL,
			'W357921', 'Spain', (select REF (c) from Course_tab c where c.COURSE_NO = 'MF94'), (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'AAS9624'), Student_Modules_nt_type(), Module_nt_type(),
			NULL));
INSERT INTO Student_tab_Sub
	VALUES (Student_typ_Sub('js.williams@ais.ac.ar', 'Miss', 'Jane', 'Susan', 'Williams', '10-AUG-1996', 'U', '19-SEP-2018',  07707326514, (select REF (d) from Department_tab d where d.DEPT_NAME = 'Computer and Information Sciences'), NULL, NULL,
			'S864232', 'Spain', (select REF (c) from Course_tab c where c.COURSE_NO = 'AI64'), (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ACS0379'), Student_Modules_nt_type(), Module_nt_type(),
			NULL));
INSERT INTO Student_tab_Sub
	VALUES (Student_typ_Sub('raj.laghari@ais.ac.ar', 'Mr', 'Raj', 'Ahmed', 'Laghari', '27-FEB-1998', 'M', '21-SEP-2017',  07825489677, (select REF (d) from Department_tab d where d.DEPT_NAME = 'Sport Exercise and Rehabilitation'), NULL, NULL,
			'K074177', 'India', (select REF (c) from Course_tab c where c.COURSE_NO = 'CX61'), (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ASE3552'), Student_Modules_nt_type(), Module_nt_type(),
			NULL));
INSERT INTO Student_tab_Sub
	VALUES (PartTimeStudent_typ_Sub('j.karllson@ais.ac.ar', 'Mr', 'Josef', 'Han', 'Karlsson', '16-OCT-1981', 'M', '20-SEP-2016',  07612674900, (select REF (d) from Department_tab d where d.DEPT_NAME = 'Sport Exercise and Rehabilitation'), NULL, NULL,
			'W558370', 'Stockholm', (select REF (c) from Course_tab c where c.COURSE_NO = 'CE21'), (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ASE3552'), Student_Modules_nt_type(), Module_nt_type(),
			NULL, 20));
INSERT INTO Student_tab_Sub
	VALUES (Student_typ_Sub('xi.zhao@ais.ac.ar', 'Mr', 'Xi',  'Bo', 'Zhao', '14-NOV-1993', 'M', '20-SEP-2016',  07612674900, (select REF (d) from Department_tab d where d.DEPT_NAME = 'Sport Exercise and Rehabilitation'), NULL, NULL,
			'K386411', 'Hong Kong', (select REF (c) from Course_tab c where c.COURSE_NO = 'PR45'), (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ASE0075'), Student_Modules_nt_type(), Module_nt_type(),
			NULL));
INSERT INTO Student_tab_Sub
	VALUES (PartTimeStudent_typ_Sub('teresa.green@ais.ac.ar', 'Ms', 'Teresa', NULL, 'Green', '21-DEC-1996', 'F', '22-SEP-2019',  077723155505, (select REF (d) from Department_tab d where d.DEPT_NAME = 'Computer and Information Sciences'), NULL, NULL,
			'S165739', 'Spain', (select REF (c) from Course_tab c where c.COURSE_NO = 'AC88'), (select REF (f) from Faculty_tab_Sub f where f.STAFF_NO = 'ACS2950'), Student_Modules_nt_type(), Module_nt_type(),
			NULL, 15));			

REM populate Student_tab_Sub.Study which is a nested table of type Module_nt_type

INSERT INTO TABLE (SELECT s.Study from Student_tab_Sub s WHERE s.STUDENT_NO = 'W357921')
	SELECT REF (m) from Module_tab m WHERE m.MODULE_NO IN ('AP0400', 'AP0411', 'AP0408', 'AP0504', 'CR5006', 'AP0511', 'AP0536', 'AP0610', 'AP0607', 'CR6007', 'CR6002', 'AP0601');
INSERT INTO TABLE (SELECT s.Study from Student_tab_Sub s WHERE s.STUDENT_NO = 'K074177')
	SELECT REF (m) from Module_tab m WHERE m.MODULE_NO IN ('SP0475', 'SP0477', 'SD0412', 'SP5010', 'SP5012', 'SP6008', 'SP6033', 'SP0739');
INSERT INTO TABLE (SELECT s.Study from Student_tab_Sub s WHERE s.STUDENT_NO = 'S864232')
	SELECT REF (m) from Module_tab m WHERE m.MODULE_NO IN ('KV7003', 'KF7010', 'KV7004',  'KV7005');
INSERT INTO TABLE (SELECT s.Study from Student_tab_Sub s WHERE s.STUDENT_NO = 'W558370')
	SELECT REF (m) from Module_tab m WHERE m.MODULE_NO IN ('SP0738', 'SP0740', 'SP0732');
INSERT INTO TABLE (SELECT s.Study from Student_tab_Sub s WHERE s.STUDENT_NO = 'K386411')
	SELECT REF (m) from Module_tab m WHERE m.MODULE_NO IN ('SP0733', 'SP1844', 'SP0732');
INSERT INTO TABLE (SELECT s.Study from Student_tab_Sub s WHERE s.STUDENT_NO = 'S165739')
	SELECT REF (m) from Module_tab m WHERE m.MODULE_NO IN ('KF7011', 'KF7023', 'KF7028');
			
REM populate Module_tab.Students which is a nested table of type Student_nt_typ

INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'AP0400')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W357921');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'AP0411')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W357921');	
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'AP0408')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W357921');			
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'AP0504')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W357921');			
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'CR5006')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W357921');			
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'AP0511')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W357921');			
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'AP0536')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W357921');			
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'AP0610')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W357921');			
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'AP0607')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W357921');			
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'CR6007')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W357921');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'CR6002')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W357921');	
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'AP0601')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W357921');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'SP0475')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('K074177');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'SP0477')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('K074177');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'SD0412')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('K074177');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'SP5010')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('K074177');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'SP5012')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('K074177');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'SP6008')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('K074177');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'SP6033')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ( 'K074177');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'SP0739')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('K074177');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'KV7003')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('S864232');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'KF7010')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('S864232');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'KV7004')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('S864232');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'KV7005')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('S864232');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'SP0738')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W558370');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'SP0740')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W558370');
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'SP0732')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('W558370', 'K386411');	
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'SP1844')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('K386411');	
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'SP0733')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('K386411');	
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'KF7028')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('S165739');	
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'KF7023')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('S165739');	
INSERT INTO TABLE (SELECT m.Students from Module_tab m WHERE m.MODULE_NO = 'KF7011')
	SELECT REF (s) from Student_tab_Sub s WHERE s.STUDENT_NO IN ('S165739');		
	
REM populate Department_tab.Staff_Students (with Student details) which is a nested table of type Person_nt_typ

INSERT INTO TABLE (SELECT d.Staff_Students from Department_tab d WHERE d.DEPT_NAME = 'Applied Sciences')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.DEPT_ref.DEPT_NAME = 'Applied Sciences';		
INSERT INTO TABLE (SELECT d.Staff_Students from Department_tab d WHERE d.DEPT_NAME = 'Computer and Information Sciences')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.DEPT_ref.DEPT_NAME = 'Computer and Information Sciences';
INSERT INTO TABLE (SELECT d.Staff_Students from Department_tab d WHERE d.DEPT_NAME = 'Sport Exercise and Rehabilitation')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.DEPT_ref.DEPT_NAME = 'Sport Exercise and Rehabilitation';			
			
REM populate nested table Enrolled_students of type Student_nt_typ in Course_tab

INSERT INTO TABLE (SELECT c.Enrolled_students from Course_tab c WHERE c.COURSE_NO = 'MF94')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'W357921';
INSERT INTO TABLE (SELECT c.Enrolled_students from Course_tab c WHERE c.COURSE_NO = 'AI64')			
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'S864232';
INSERT INTO TABLE (SELECT c.Enrolled_students from Course_tab c WHERE c.COURSE_NO = 'AC88')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'S165739';
INSERT INTO TABLE (SELECT c.Enrolled_students from Course_tab c WHERE c.COURSE_NO = 'CX61')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'K074177'; 
INSERT INTO TABLE (SELECT c.Enrolled_students from Course_tab c WHERE c.COURSE_NO = 'CE21')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'W558370';
INSERT INTO TABLE (SELECT c.Enrolled_students from Course_tab c WHERE c.COURSE_NO = 'PR45')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'K386411';

REM populate Faculty_tab_Sub.Students_tutored which is a nested table of type Student_nt_typ
	
INSERT INTO TABLE (SELECT f.Students_tutored FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS9624')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.Student_Tutor_ref.STAFF_NO = 'AAS9624';
INSERT INTO TABLE (SELECT f.Students_tutored FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS0379')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.Student_Tutor_ref.STAFF_NO = 'ACS0379';
INSERT INTO TABLE (SELECT f.Students_tutored FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS2950')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.Student_Tutor_ref.STAFF_NO = 'ACS2950';
INSERT INTO TABLE (SELECT f.Students_tutored FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE3552')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.Student_Tutor_ref.STAFF_NO = 'ASE3552';	
INSERT INTO TABLE (SELECT f.Students_tutored FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE0075')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.Student_Tutor_ref.STAFF_NO = 'ASE0075';

REM populate Faculty_tab_Sub.Teach_respons which is a nested table of type Teaching_nt_typ

INSERT INTO TABLE (SELECT f.Teach_respons FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS9624')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff.STAFF_NO = 'AAS9624';
INSERT INTO TABLE (SELECT f.Teach_respons FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS8241')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff.STAFF_NO = 'AAS8241';	
INSERT INTO TABLE (SELECT f.Teach_respons FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS0379')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff.STAFF_NO = 'ACS0379';	
INSERT INTO TABLE (SELECT f.Teach_respons FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS2950')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff.STAFF_NO = 'ACS2950';
INSERT INTO TABLE (SELECT f.Teach_respons FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS1158')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff.STAFF_NO = 'ACS1158';	
INSERT INTO TABLE (SELECT f.Teach_respons FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE3552')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff.STAFF_NO = 'ASE3552';	
INSERT INTO TABLE (SELECT f.Teach_respons FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE0075')
	SELECT REF (t) FROM Teaching_tab t WHERE t.FK_Staff.STAFF_NO = 'ASE0075';	
	
REM creating Student_Modules objects 

INSERT INTO Student_Modules_tab 
	VALUES ('1', 58.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W357921'), (select REF (m) from Module_tab m where m.MODULE_NO = 'AP0400'));
INSERT INTO Student_Modules_tab
	VALUES ('1', 63.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W357921'), (select REF (m) from Module_tab m where m.MODULE_NO = 'AP0411'));
INSERT INTO  Student_Modules_tab
	VALUES ('1', 69, NULL,  (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W357921'), (select REF (m) from Module_tab m where m.MODULE_NO = 'AP0408'));
INSERT INTO Student_Modules_tab
	VALUES ('2', 48.50, 50, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W357921'), (select REF (m) from Module_tab m where m.MODULE_NO = 'AP0504'));
INSERT INTO Student_Modules_tab
	VALUES ('2', 67.50, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W357921'), (select REF (m) from Module_tab m where m.MODULE_NO = 'CR5006'));
INSERT INTO Student_Modules_tab
	VALUES ('2', 72.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W357921'), (select REF (m) from Module_tab m where m.MODULE_NO = 'AP0511'));
INSERT INTO Student_Modules_tab
	VALUES ('3', NULL, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W357921'), (select REF (m) from Module_tab m where m.MODULE_NO = 'AP0536'));
INSERT INTO Student_Modules_tab
	VALUES ('3', NULL, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W357921'), (select REF (m) from Module_tab m where m.MODULE_NO = 'AP0610'));
INSERT INTO Student_Modules_tab
	VALUES ('3', NULL, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W357921'), (select REF (m) from Module_tab m where m.MODULE_NO = 'AP0607'));
INSERT INTO Student_Modules_tab
	VALUES ('4', NULL, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W357921'), (select REF (m) from Module_tab m where m.MODULE_NO = 'CR6007'));
INSERT INTO Student_Modules_tab
	VALUES ('4', NULL, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W357921'), (select REF (m) from Module_tab m where m.MODULE_NO = 'CR6002'));
INSERT INTO Student_Modules_tab
	VALUES ('4', NULL, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W357921'), (select REF (m) from Module_tab m where m.MODULE_NO = 'AP0601'));
INSERT INTO Student_Modules_tab
	VALUES ('1', 68.50, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'K074177'), (select REF (m) from Module_tab m where m.MODULE_NO = 'SP0475'));
INSERT INTO Student_Modules_tab
	VALUES ('1', 75.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'K074177'), (select REF (m) from Module_tab m where m.MODULE_NO = 'SP0477'));
INSERT INTO Student_Modules_tab 
	VALUES ('1', 78.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'K074177'), (select REF (m) from Module_tab m where m.MODULE_NO = 'SD0412'));	
INSERT INTO Student_Modules_tab 
	VALUES ('2', 66.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'K074177'), (select REF (m) from Module_tab m where m.MODULE_NO = 'SP5010'));
INSERT INTO Student_Modules_tab 
	VALUES ('2', 70.50, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'K074177'), (select REF (m) from Module_tab m where m.MODULE_NO = 'SP5012'));
INSERT INTO Student_Modules_tab 
	VALUES ('3', 80.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'K074177'), (select REF (m) from Module_tab m where m.MODULE_NO = 'SP6008'));
INSERT INTO Student_Modules_tab 
	VALUES ('3', 68.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'K074177'), (select REF (m) from Module_tab m where m.MODULE_NO = 'SP6033'));
INSERT INTO Student_Modules_tab 
	VALUES ('3', 82.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'K074177'), (select REF (m) from Module_tab m where m.MODULE_NO = 'SP0739'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', 59.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'S864232'), (select REF (m) from Module_tab m where m.MODULE_NO = 'KV7003'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', 63.50, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'S864232'), (select REF (m) from Module_tab m where m.MODULE_NO = 'KF7010'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', 73.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'S864232'), (select REF (m) from Module_tab m where m.MODULE_NO = 'KV7004'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', 80.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'S864232'), (select REF (m) from Module_tab m where m.MODULE_NO = 'KV7005'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', 58.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W558370'), (select REF (m) from Module_tab m where m.MODULE_NO = 'SP0738'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', 69.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W558370'), (select REF (m) from Module_tab m where m.MODULE_NO = 'SP0740'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', 78.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'W558370'), (select REF (m) from Module_tab m where m.MODULE_NO = 'PY0756'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', 54.50, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'K386411'), (select REF (m) from Module_tab m where m.MODULE_NO = 'SP0733'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', 43.50, 50, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'K386411'), (select REF (m) from Module_tab m where m.MODULE_NO = 'SP1844'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', 58.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'K386411'), (select REF (m) from Module_tab m where m.MODULE_NO = 'SP0732'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', 66.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'K386411'), (select REF (m) from Module_tab m where m.MODULE_NO = 'PY0756'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', 69.00, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'S165739'), (select REF (m) from Module_tab m where m.MODULE_NO = 'KF7010'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', NULL, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'S165739'), (select REF (m) from Module_tab m where m.MODULE_NO = 'KF7011'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', NULL, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'S165739'), (select REF (m) from Module_tab m where m.MODULE_NO = 'KF7023'));
INSERT INTO Student_Modules_tab 
	VALUES ('M', 74.50, NULL, (select REF (s) from Student_tab_Sub s where s.STUDENT_NO = 'S165739'), (select REF (m) from Module_tab m where m.MODULE_NO = 'KF7028'));
	
REM populate Module_tab.Student_Marks which is a nested table of type Student_Modules_nt_type
	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'AP0400')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'AP0400';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'AP0411')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'AP0411';		
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'AP0408')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'AP0408';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'AP0504')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'AP0504';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'CR5006')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'CR5006';		
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'AP0511')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'AP0511';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'AP0536')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'AP0536';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'AP0610')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'AP0610';		
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'AP0607')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'AP0607';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'CR6007')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'CR6007';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'CR6002')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'CR6002';		
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'AP0601')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'AP0601';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'SP0475')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'SP0475';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'SP0477')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'SP0477';		
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'SD0412')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'SD0412';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'SP5010')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'SP5010';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'SP5012')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'SP5012';		
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'SP6008')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'SP6008';		
	INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'SP6033')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'SP6033';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'SP0739')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'SP0739';		
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'KV7003')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'KV7003';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'KF7010')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'KF7010';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'KV7004')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'KV7004';		
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'KV7005')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'KV7005';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'SP0738')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'SP0738';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'SP0740')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'SP0740';		
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'PY0756')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'PY0756';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'SP0733')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'SP0733';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'SP1844')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'SP1844';		
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'SP0732')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'SP0732';		
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'KF7011')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'KF7011';		
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'KF7023')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'KF7023';	
INSERT INTO TABLE (SELECT m.Student_Marks from Module_tab m WHERE m.MODULE_NO = 'KF7028')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student_Modules.MODULE_NO = 'KF7028';	

REM populate Student_tab_Sub.Marks which is a nested table of type Student_Modules_nt_type

INSERT INTO TABLE (SELECT s.Marks from Student_tab_Sub s WHERE s.STUDENT_NO = 'W357921')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student.STUDENT_NO = 'W357921';	
INSERT INTO TABLE (SELECT s.Marks from Student_tab_Sub s WHERE s.STUDENT_NO = 'S864232')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student.STUDENT_NO = 'S864232';	
INSERT INTO TABLE (SELECT s.Marks from Student_tab_Sub s WHERE s.STUDENT_NO = 'K074177')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student.STUDENT_NO = 'K074177';	
INSERT INTO TABLE (SELECT s.Marks from Student_tab_Sub s WHERE s.STUDENT_NO = 'W558370')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student.STUDENT_NO = 'W558370';	
INSERT INTO TABLE (SELECT s.Marks from Student_tab_Sub s WHERE s.STUDENT_NO = 'K386411')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student.STUDENT_NO = 'K386411';	
INSERT INTO TABLE (SELECT s.Marks from Student_tab_Sub s WHERE s.STUDENT_NO = 'S165739')
	SELECT REF (sm) FROM Student_Modules_tab sm WHERE sm.FK_Student.STUDENT_NO = 'S165739';	
	
REM creating Address objects (Dept)

INSERT INTO Address_tab
	VALUES ('0001A', 'Northumberland Street', 'Bilbao', 'Biscay', 'BC13 2NL', 01912437900, (select REF (d) from Department_tab d
		where d.DEPT_NAME = 'Applied Sciences'), NULL, NULL);
INSERT INTO Address_tab	
	VALUES ('0001B', 'Sandy Lane', 'Bilbao', 'Biscay', 'BC43 6PQ', 01912274274, (select REF (d) from Department_tab d
		where d.DEPT_NAME = 'Applied Sciences'), NULL, NULL); 
INSERT INTO Address_tab
	VALUES ('0002A', 'Ellison Street', 'San Sebastian', 'Biscay', 'SB12 9SN', 01912427866, (select REF (d) from Department_tab d
		where d.DEPT_NAME = 'Computer and Information Sciences'), NULL, NULL); 
INSERT INTO Address_tab
	VALUES ('0002B', 'Rudolph Crescent', 'Bilbao', 'Biscay', 'BC27 5ET', 01912290943, (select REF (d) from Department_tab d
		where d.DEPT_NAME = 'Computer and Information Sciences'), NULL, NULL); 
INSERT INTO Address_tab
	VALUES ('0003A', 'Central Courseway', 'Bilbao', 'Biscay', 'BC61 9PE', 01912458723, (select REF (d) from Department_tab d
		where d.DEPT_NAME = 'Sport Exercise and Rehabilitation'), NULL, NULL); 
INSERT INTO Address_tab
	VALUES ('0003B', 'Armstrong Park', 'Bilbao', 'Biscay', 'BC22 1SW', 01912219065, (select REF (d) from Department_tab d
		where d.DEPT_NAME = 'Sport Exercise and Rehabilitation'), NULL, NULL); 
		
REM Link Addresses to Department by populating Prim_Address and Sec_Address
		
UPDATE Department_tab
	SET Prim_Address = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0001A')
	WHERE DEPT_NAME = 'Applied Sciences';
UPDATE Department_tab
	SET Sec_Address = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0001B')
	WHERE DEPT_NAME = 'Applied Sciences';
UPDATE Department_tab
	SET Prim_Address = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0002A')
	WHERE DEPT_NAME = 'Computer and Information Sciences';	
UPDATE Department_tab
	SET Sec_Address = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0002B')
	WHERE DEPT_NAME = 'Computer and Information Sciences';	
UPDATE Department_tab
	SET Prim_Address = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0003A')
	WHERE DEPT_NAME = 'Sport Exercise and Rehabilitation';	
UPDATE Department_tab
	SET Sec_Address = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0003B')
	WHERE DEPT_NAME = 'Sport Exercise and Rehabilitation';

REM creating Address objects (Faculty) 
	
INSERT INTO Address_tab 
	VALUES ('0010A', '6 Saville Place', 'Bilbao', 'Biscay', 'BC23 8PA', 01912437900, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0011A', '64 St Andrews Street', 'Bilbao', 'Biscay', 'BC25 4JF', 01916672451, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0012A',  '2 Waterside', 'Vitoria', 'Biscay', 'VT56 4JT', 01912427866, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0013A', '9 Kirkwood Court', 'San Sebastian', 'Biscay', 'SB21 9LN', 01912888673, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0014A', '11 Bells Close', 'Bilbao', 'Biscay', 'BC28 5PT', 01918925754, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0015A', '27 Broadway', 'Bilbao', 'Biscay', 'BC21 7DE', 01912458723, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0016A', '10 Chancellor Way', 'Bilbao', 'Biscay', 'BC67 5RE', 01912987321, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0017A', '63 St Peters Wharf', 'Bilbao', 'Biscay', 'BC83 9DT', 01912446387, NULL, Person_nt_typ(), NULL);	
	
REM Link Address to Faculty by populating HAddress_ref

UPDATE Faculty_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0010A')
	WHERE STAFF_NO = 'AAS9624';
UPDATE Faculty_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0011A')
	WHERE STAFF_NO = 'AAS8241';
UPDATE Faculty_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0012A')
	WHERE STAFF_NO = 'ACS0379';
UPDATE Faculty_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0013A')
	WHERE STAFF_NO = 'ACS2950';
UPDATE Faculty_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0014A')
	WHERE STAFF_NO = 'ACS1158';
UPDATE Faculty_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0015A')
	WHERE STAFF_NO = 'ASE3552';
UPDATE Faculty_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0016A')
	WHERE STAFF_NO = 'ASE0075';
UPDATE Faculty_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0017A')
	WHERE STAFF_NO = 'ASE5566';

REM populate Address_tab.Address_of which is a nested table of type Person_nt_type

INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0010A')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS9624';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0011A')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS8241';	
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0012A')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS0379';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0013A')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS2950';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0014A')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS1158';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0015A')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE3552';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0016A')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE0075';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0017A')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE5566';	

REM creating Address objects (Student)
	
INSERT INTO Address_tab 
	VALUES ('0100A', '23 Bishops Court', 'Bilbao', 'Biscay', 'BC98 7AS', 01951675934, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0100B', '4  Westgate Road', 'Biscay', 'Bilbao', 'BC24 9ER', 01951568234, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0200A', '2 The Cloisters', 'Bilbao', 'Biscay',	'BC12 5HN', 01951895104, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0200B', '101 Grainger Street', 'Bilbao', 'Biscay', 'BC97 2TN', 01951728903, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0300A', 'Ispat Bhavan',	'Lodhi Road', 'New Delhi', '110003', 912212345670, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0300B', '6 Saville Place', 'Bilbao', 'Biscay', 'BC32 1LM', 01951807312, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0400A', 'Roslagsgatan 10',	'113 51', 'Stockholm', 'Null', 46290751264, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0400B', '2 Hood Street', 'Bilbao', 'Biscay', 'BC12 9BA', 01951993576, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0500A', 'Flat D 6F Acacia Building 150 Kennedy Road', 'Wan Chai',	'Hong Kong', 'Null', 86091573890, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0500B', '71 Great North Road', 'Bilbao', 'Biscay', 'BC76 5SA', 01951367934, NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0600A', '16 New Devonshire Road', 'Bilbao', 'Biscay', 'BC23 6RH', 01951899924,  NULL, Person_nt_typ(), NULL);
INSERT INTO Address_tab
	VALUES ('0600B', '16 New Devonshire Road', 'Bilbao', 'Biscay', 'BC23 6RH', 01951899924, NULL, Person_nt_typ(), NULL);

REM Link Address to Student by populating HAddress_ref and Student_TAddress

UPDATE Student_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0100A')
	WHERE STUDENT_NO = 'W357921';
UPDATE Student_tab_Sub
	SET Student_TAddress = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0100B')
	WHERE STUDENT_NO = 'W357921';	
UPDATE Student_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0200A')
	WHERE STUDENT_NO = 'S864232';
UPDATE Student_tab_Sub
	SET Student_TAddress = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0200B')
	WHERE STUDENT_NO = 'S864232';		
UPDATE Student_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0300A')
	WHERE STUDENT_NO = 'K074177';
UPDATE Student_tab_Sub
	SET Student_TAddress = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0300B')
	WHERE STUDENT_NO = 'K074177';	
UPDATE Student_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0400A')
	WHERE STUDENT_NO = 'W558370';
UPDATE Student_tab_Sub
	SET Student_TAddress = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0400B')
	WHERE STUDENT_NO = 'W558370';	
UPDATE Student_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0500A')
	WHERE STUDENT_NO = 'K386411';
UPDATE Student_tab_Sub
	SET Student_TAddress = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0500B')
	WHERE STUDENT_NO = 'K386411';	
UPDATE Student_tab_Sub
	SET HAddress_ref = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0600A')
	WHERE STUDENT_NO = 'S165739';
UPDATE Student_tab_Sub
	SET Student_TAddress = (SELECT REF (a) FROM Address_tab a WHERE a.ADDRESS_ID = '0600B')
	WHERE STUDENT_NO = 'S165739';	
	
REM populate Address_tab.Address_of which is a nested table of type Person_nt_typ

INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0100A')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'W357921';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0100B')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'W357921';	
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0200A')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'S864232';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0200B')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'S864232';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0300A')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'K074177';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0300B')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'K074177';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0400A')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'W558370';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0400B')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'W558370';	
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0500A')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'K386411';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0500B')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'K386411';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0600A')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'S165739';
INSERT INTO TABLE (SELECT a.Address_of FROM Address_tab a WHERE a.ADDRESS_ID = '0600B')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'S165739';

REM creating Address objects (NOK) 

INSERT INTO Address_tab
	VALUES ('1000F', '6 Saville Place', 'Bilbao', 'Biscay', 'BC23 8PA', 01912437900, NULL, NULL, NextOfKin_nt_type());
INSERT INTO Address_tab
	VALUES ('2000F', '64 St Andrews Street', 'Bilbao', 'Biscay', 'BC25 4JF', 01916672451, NULL, NULL, NextOfKin_nt_type());
INSERT INTO Address_tab
	VALUES ('3000F', '2 Waterside', 'Vitoria','Biscay', 'VT56 4JT', 01912427866, NULL, NULL, NextOfKin_nt_type());
INSERT INTO Address_tab
	VALUES ('4000F', '9 Kirkwood Court', 'San Sebastian', 'Biscay', 'SB21 9LN', 01912888673, NULL, NULL, NextOfKin_nt_type());
INSERT INTO Address_tab
	VALUES ('5000F', '11 Bells Close', 'Bilbao', 'Biscay', 'BC28 5PT', 01918925754, NULL, NULL, NextOfKin_nt_type());
INSERT INTO Address_tab
	VALUES ('6000F', '27 Broadway', 'Bilbao', 'Biscay', 'BC21 7DE', 01912458723, NULL, NULL, NextOfKin_nt_type());
INSERT INTO Address_tab
	VALUES ('7000F', '10 Chancellor Way', 'Bilbao', 'Biscay', 'BC67 5RE', 01912987321, NULL, NULL, NextOfKin_nt_type());
INSERT INTO Address_tab
	VALUES ('8000F', '63 St Peters Wharf', 'Bilbao', 'Biscay', 'BC83 9DT', 01912446387, NULL, NULL, NextOfKin_nt_type());
INSERT INTO Address_tab 
	VALUES ('1000S', '23 Bishops Court', 'Bilbao', 'Biscay', 'BC98 7AS', 01951675934, NULL, NULL, NextOfKin_nt_type());
INSERT INTO Address_tab
	VALUES ('2000S', '2 The Cloisters', 'Bilbao', 'Biscay', 'BC12 5HN', 01951895104, NULL, NULL, NextOfKin_nt_type());
INSERT INTO Address_tab
	VALUES ('3000S', 'Ispat Bhavan', 'Lodhi Road', 'New Delhi', '110003', 91221234567, NULL, NULL, NextOfKin_nt_type());
INSERT INTO Address_tab
	VALUES ('4000S', 'Roslagsgatan 10', '113 51', 'Stockholm', NULL, 46290751264, NULL, NULL, NextOfKin_nt_type());
INSERT INTO Address_tab
	VALUES ('5000S', 'Flat D 6F Acacia Building', '150 Kennedy Road', 'Wan Chai', NULL, 86091573890, NULL, NULL, NextOfKin_nt_type());
INSERT INTO Address_tab
	VALUES ('6000S', '77 Mayfair Road', 'Bilbao', 'Biscay', 'BC66 9KL', 01951777883, NULL, NULL, NextOfKin_nt_type());

REM creating NextOfKin objects without populating Person nested table

INSERT INTO NextOfKin_tab
	VALUES ('001KF', 'Mr Michael May', 'Husband', 07798135612, (select REF (a) from Address_tab a where a.ADDRESS_ID = '1000F'), Person_nt_typ());
INSERT INTO NextOfKin_tab
	VALUES ('002KF', 'Dr Mary Hulmes', 'Wife', 07821673890, (select REF (a) from Address_tab a where a.ADDRESS_ID = '2000F'), Person_nt_typ());
INSERT INTO NextOfKin_tab
	VALUES ('003KF', 'Mr Max Staithes', 'Partner', 07734001783, (select REF (a) from Address_tab a where a.ADDRESS_ID = '3000F'), Person_nt_typ());
INSERT INTO NextOfKin_tab
	VALUES ('004KF', 'Mrs Sarita Chandran', 'Wife', 07921457352, (select REF (a) from Address_tab a where a.ADDRESS_ID = '4000F'), Person_nt_typ());
INSERT INTO NextOfKin_tab
	VALUES ('005KF', 'Mrs Sarah Patterson', 'Wife',  07993666271, (select REF (a) from Address_tab a where a.ADDRESS_ID = '5000F'), Person_nt_typ());
INSERT INTO NextOfKin_tab
	VALUES ('006KF', 'Mr Mike Benson', 'Husband', 07726498763, (select REF (a) from Address_tab a where a.ADDRESS_ID = '6000F'), Person_nt_typ());
INSERT INTO NextOfKin_tab
	VALUES ('007KF', 'Mrs Julie Levison', 'Wife', 07986345178, (select REF (a) from Address_tab a where a.ADDRESS_ID = '7000F'), Person_nt_typ());
INSERT INTO NextOfKin_tab
	VALUES ('008KF', 'Mr Dennis Campbell', 'Husband', 07877210043, (select REF (a) from Address_tab a where a.ADDRESS_ID = '8000F'), Person_nt_typ());
INSERT INTO NextOfKin_tab
	VALUES ('001KS', 'Mrs Olivia Jennings', 'Mother', 07835612121, (select REF (a) from Address_tab a where a.ADDRESS_ID = '1000S'), Person_nt_typ());
INSERT INTO NextOfKin_tab
	VALUES ('002KS', 'Mrs Lane Williams', 'Mother', 07753290075, (select REF (a) from Address_tab a where a.ADDRESS_ID = '2000S'), Person_nt_typ());
INSERT INTO NextOfKin_tab
	VALUES ('003KS','Mr Jai Laghari', 'Father', 01189568320, (select REF (a) from Address_tab a where a.ADDRESS_ID = '3000S'), Person_nt_typ());
INSERT INTO NextOfKin_tab
	VALUES ('004KS', 'Mrs Maja Karlsson', 'Wife', 02371105664, (select REF (a) from Address_tab a where a.ADDRESS_ID = '4000S'), Person_nt_typ());
INSERT INTO NextOfKin_tab
	VALUES ('005KS', 'Mrs Chen Zhao', 'Wife', 09996461142, (select REF (a) from Address_tab a where a.ADDRESS_ID = '5000S'), Person_nt_typ());
INSERT INTO NextOfKin_tab
	VALUES ('006KS', 'Mr Geoff Green', 'Father', 07898453210, (select REF (a) from Address_tab a where a.ADDRESS_ID = '6000S'), Person_nt_typ());

REM Link NextOfKin to Faculty by populating NOK_ref 

UPDATE Faculty_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '001KF')
	WHERE STAFF_NO = 'AAS9624';
UPDATE Faculty_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '002KF')
	WHERE STAFF_NO = 'AAS8241';	
UPDATE Faculty_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '003KF')
	WHERE STAFF_NO = 'ACS0379';	
UPDATE Faculty_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '004KF')
	WHERE STAFF_NO = 'ACS2950';	
UPDATE Faculty_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '005KF')
	WHERE STAFF_NO = 'ACS1158';
UPDATE Faculty_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '006KF')
	WHERE STAFF_NO = 'ASE3552';	
UPDATE Faculty_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '007KF')
	WHERE STAFF_NO = 'ASE0075';	
UPDATE Faculty_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '008KF')
	WHERE STAFF_NO = 'ASE5566';		
	
REM Link NextOfKin to Student by populating NOK_ref
	
UPDATE Student_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '001KS')
	WHERE STUDENT_NO = 'W357921';		
UPDATE Student_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '002KS')
	WHERE STUDENT_NO ='S864232';		
UPDATE Student_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '003KS')
	WHERE STUDENT_NO = 'K074177';	
	UPDATE Student_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '004KS')
	WHERE STUDENT_NO = 'W558370';		
UPDATE Student_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '005KS')
	WHERE STUDENT_NO = 'K386411';		
UPDATE Student_tab_Sub
	SET NOK_ref = (SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_ID = '006KS')
	WHERE STUDENT_NO = 'S165739';
	
REM populate NextOfKin_tab.NOK_to which is a nested table of type Person_nt_typ

INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '001KF')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'AAS9624';
INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '002KF')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO ='AAS8241';	
INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '003KF')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS0379';
INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '004KF')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS2950';
INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '005KF')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ACS1158';
INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '006KF')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE3552';	
INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '007KF')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE0075';
INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '008KF')
	SELECT REF (f) FROM Faculty_tab_Sub f WHERE f.STAFF_NO = 'ASE5566';

INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '001KS')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'W357921';
INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '002KS')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'S864232';
INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '003KS')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'K074177';
INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '004KS')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'W558370';	
INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '005KS')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'K386411';
INSERT INTO TABLE (SELECT n.NOK_to FROM NextOfKin_tab n WHERE n.NOK_ID = '006KS')
	SELECT REF (s) FROM Student_tab_Sub s WHERE s.STUDENT_NO = 'S165739';
	
REM populate Address_tab.NOK_Address which is a nested table of NextOfKin_nt_type

INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '1000F')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '1000F';
INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '2000F')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '2000F';
INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '3000F')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '3000F';
INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '4000F')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '4000F';
INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '5000F')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '5000F';
INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '6000F')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '6000F';
INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '7000F')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '7000F';
INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '8000F')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '8000F';
INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '1000S')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '1000S';
INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '2000S')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '2000S';
INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '3000S')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '3000S';
INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '4000S')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '4000S';
INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '5000S')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '5000S';
INSERT INTO TABLE (SELECT a.NOK_Address FROM Address_tab a WHERE a.ADDRESS_ID = '6000S')
	SELECT REF (n) FROM NextOfKin_tab n WHERE n.NOK_Address_ref.ADDRESS_ID = '6000S';
	
COMMIT;

SET ECHO OFF






	