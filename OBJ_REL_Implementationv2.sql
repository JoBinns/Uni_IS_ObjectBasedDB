SET VERIFY ON
SET ECHO ON

DROP Type Address_t FORCE
/
DROP Type Address_ref_t FORCE
/
DROP Type NextOfKin_t FORCE
/
DROP Type NextOfKin_ref_t FORCE
/
DROP Type NextOfKin_nt_type FORCE
/
DROP Type Department_t FORCE
/
DROP Type Course_t FORCE
/
DROP Type Course_ref_t FORCE
/
DROP Type Course_nt_type FORCE
/
DROP Type Module_t FORCE
/
DROP Type Module_ref_t FORCE
/
DROP Type Module_nt_type FORCE
/
DROP Type Teaching_t FORCE
/
DROP Type Teaching_ref_t FORCE
/
DROP Type Teaching_nt_type FORCE
/
DROP Type Student_Modules_t FORCE
/
DROP Type Student_Modules_ref_t FORCE
/
DROP Type Student_Modules_nt_type FORCE
/
DROP Type Chair_t FORCE
/
DROP Type Chair_ref_t FORCE
/
DROP Type Chair_nt_type FORCE
/
DROP Type Person_typ_Sup FORCE
/
DROP Type Person_ref_typ_Sup FORCE
/
DROP Type Person_nt_typ FORCE
/
DROP Type Student_typ_Sub FORCE
/
DROP Type Student_ref_typ_Sub FORCE
/
DROP Type Student_nt_typ FORCE
/
DROP Type Faculty_typ_Sub FORCE
/ 
DROP Type Faculty_ref_typ_Sub FORCE
/
DROP Type Faculty_nt_typ FORCE
/
DROP Type PartTimeStudent_typ_Sub FORCE
/
DROP Type Qualifications_t FORCE
/
DROP Type Qualifications_varray_type FORCE
/
DROP TABLE Address_Tab CASCADE CONSTRAINTS PURGE
/
DROP TABLE NextOfKin_Tab CASCADE CONSTRAINTS PURGE
/
DROP TABLE Faculty_tab_Sub CASCADE CONSTRAINTS PURGE
/
DROP TABLE Student_tab_Sub CASCADE CONSTRAINTS PURGE
/
DROP TABLE Department_tab CASCADE CONSTRAINTS PURGE
/
DROP TABLE Course_tab CASCADE CONSTRAINTS PURGE
/
DROP TABLE Module_tab CASCADE CONSTRAINTS PURGE
/
DROP TABLE Teaching_tab CASCADE CONSTRAINTS PURGE
/
DROP TABLE Student_Modules_tab CASCADE CONSTRAINTS PURGE
/
DROP TABLE Chair_tab CASCADE CONSTRAINTS PURGE
/



CREATE Type Address_t 
/

CREATE Type Address_ref_t AS OBJECT (
AddressRef			REF Address_t
);
/

CREATE Type NextOfKin_t
/

CREATE Type NextOfKin_ref_t AS OBJECT (
NextOfKinRef		REF NextOfKin_t
);
/

CREATE Type NextOfKin_nt_type as Table of NextOfKin_ref_t
/

CREATE Type Department_t
/

CREATE Type Person_typ_Sup
/

CREATE Type Person_ref_typ_Sup AS OBJECT (
PersonRef			REF Person_typ_Sup
);
/

CREATE Type Person_nt_typ as Table of Person_ref_typ_Sup
/

CREATE OR REPLACE Type Person_typ_Sup AS OBJECT (
UNI_EMAIL			VARCHAR (50),
TITLE				VARCHAR (10),
FIRST_NAME			VARCHAR (10),
MIDDLE_NAME			VARCHAR (10),
LAST_NAME			VARCHAR (20),
DOB					DATE,
GENDER				CHAR (1),
START_DATE			DATE,
MOBILE				NUMBER (11),
Dept_ref			REF Department_t,
HAddress_ref 		REF Address_t,
NOK_ref				REF NextOfKin_t 	
) NOT FINAL;
/

CREATE Type Course_t
/

CREATE Type Course_ref_t AS OBJECT (
CourseRef			REF Course_t
);
/

CREATE Type Course_nt_type as Table of Course_ref_t
/

CREATE Type Module_t
/

CREATE Type Module_ref_t AS OBJECT (
ModuleRef			REF Module_t
);
/

CREATE Type Module_nt_type as Table of Module_ref_t
/

CREATE Type Student_Modules_t
/

CREATE Type Student_Modules_ref_t AS OBJECT (
StudentModulesRef	REF Student_Modules_t
);
/

CREATE Type Student_Modules_nt_type as Table of Student_Modules_ref_t
/

CREATE Type Chair_t
/

CREATE Type Chair_ref_t AS OBJECT (
ChairRef			REF Chair_t
);
/

CREATE Type Chair_nt_type as Table of Chair_ref_t
/

CREATE Type Faculty_typ_Sub
/

CREATE Type Faculty_ref_typ_Sub AS OBJECT (
FacultyRef			REF Faculty_typ_Sub
);
/

CREATE Type Faculty_nt_typ as Table of Faculty_ref_typ_Sub
/

CREATE Type Student_typ_Sub
/

CREATE Type Student_ref_typ_Sub AS OBJECT (
StudentRef			REF Student_typ_Sub
);
/

CREATE Type Student_nt_typ as Table of Student_ref_typ_Sub
/

CREATE OR REPLACE Type Student_typ_Sub UNDER Person_typ_Sup (
STUDENT_NO			CHAR (7),
COUNTRY_OF_ORIGIN	VARCHAR (20),
Student_Course_ref	REF Course_t,
Student_Tutor_ref	REF Faculty_typ_Sub,
Marks 				Student_Modules_nt_type,
Study				Module_nt_type,
Student_TAddress	REF Address_t
) NOT FINAL;
/

CREATE Type PartTimeStudent_typ_Sub UNDER Student_typ_Sub (
NO_OF_HRS			NUMBER (2)
);
/

CREATE OR REPLACE Type Department_t AS Object (
DEPT_NAME			VARCHAR (100),
TELNO				NUMBER (11),
FAXNO				NUMBER (11),
EMAIL				VARCHAR (30),
Courses				Course_nt_type,
Staff_Students		Person_nt_typ,
Prim_Address 		REF Address_t,
Sec_Address			REF Address_t,
Chair 				Chair_nt_type
);
/

CREATE Type Teaching_t
/

CREATE Type Teaching_ref_t AS OBJECT (
TeachingRef			REF Teaching_t
);
/

CREATE Type Teaching_nt_type as Table of Teaching_ref_t
/

CREATE Type Qualifications_t AS OBJECT (
QNAME				VARCHAR (50),
YRGAINED			NUMBER (4),
INSTITUTION 		VARCHAR (50)
);
/

CREATE Type Qualifications_varray_type AS VARRAY (5) OF Qualifications_t;
/

CREATE OR REPLACE Type Faculty_typ_Sub UNDER Person_typ_Sup (
STAFF_NO			CHAR (7),
OFFICE_LOCATION		VARCHAR (100),
ROOM_NO				NUMBER (3),
TEL_EXT				NUMBER (3),
SALARY				NUMBER (8),
MANAGER				VARCHAR (50),
Qualifications 		Qualifications_varray_type,
Courses_led 		Course_nt_type,
Modules_tutored		Module_nt_type,
Students_tutored	Student_nt_typ,
Teach_respons		Teaching_nt_type,
Dept_chair			Chair_nt_type
) NOT FINAL;
/

CREATE OR REPLACE Type Course_t AS Object (
COURSE_NO			CHAR (4),
COURSE_NAME			VARCHAR (100),
COURSE_TYPE 		CHAR,
DURATION			VARCHAR (7),
MODE_OF_STUDY		VARCHAR (20),
REQ_CREDITS_TO_PASS	NUMBER (3),
Course_Dept_ref		REF Department_t,
Course_Staff_ref	REF Faculty_typ_Sub,
Modules				Module_nt_type,
Enrolled_students	Student_nt_typ
);
/

CREATE OR REPLACE Type Module_t AS Object (
MODULE_NO			CHAR (6),
MODULE_NAME			VARCHAR (100),
MODULE_LEVEL		CHAR,
CREDITS_HRS			NUMBER (3),
Tutors_ref			REF Faculty_typ_Sub,
Courses 			Course_nt_type,
Lecturers			Teaching_nt_type,
Student_Marks 		Student_Modules_nt_type,
Students			Student_nt_typ
);
/

CREATE OR REPLACE Type Address_t AS Object (
ADDRESS_ID			CHAR (5),
STREET				VARCHAR (50),
CITY 				VARCHAR (20),
REGION				VARCHAR (20),
POSTCODE 			VARCHAR (8),
TELNO				NUMBER (12),
Dept_Address_ref	REF Department_t,
Address_of			Person_nt_typ,
NOK_Address			NextOfKin_nt_type
);
/

CREATE OR REPLACE Type NextOfKin_t AS Object (
NOK_ID 				CHAR (5),
NOK_NAME			VARCHAR (50),
RELATIONSHIP		VARCHAR (10),
MOBILE				NUMBER (11),
NOK_Address_ref		REF Address_t,
NOK_to				Person_nt_typ
);
/

CREATE OR REPLACE Type Teaching_t AS Object (
HOURS 				NUMBER (2),
FK_Staff			REF Faculty_typ_Sub,
FK_Staff_Modules	REF Module_t
);
/

CREATE OR REPLACE Type Student_Modules_t AS Object (
YR_OF_STUDY			CHAR,
MARK				NUMBER (5, 2),
RESIT_MARK			NUMBER (2),
FK_Student			REF Student_typ_Sub,
FK_Student_Modules	REF Module_t
);
/

CREATE OR REPLACE Type Chair_t AS Object (
CSTART_DATE			DATE,
FK_Chair_Dept		REF Department_t,
FK_Chair_Professor	REF Faculty_typ_Sub
);
/

CREATE TABLE Department_tab of Department_t (
primary key (DEPT_NAME)
/*foreign key (Prim_Address) references Address_tab,
foreign key (Sec_Address) references Address_tab*/
)
Nested Table Courses Store AS Dept_Courses_NTab
Nested Table Staff_Students Store AS Dept_Person_NTab
Nested Table Chair Store AS Dept_Chair_NTab;

CREATE TABLE Address_tab of Address_t (
primary key (ADDRESS_ID),
foreign key (Dept_Address_ref) references Department_tab
)
Nested Table Address_of Store AS Address_Person_NTab
Nested Table NOK_Address Store AS Address_NOK_NTab;

CREATE TABLE NextOfKin_tab of NextOfKin_t (
primary key (NOK_ID),
foreign key (NOK_Address_ref) references Address_tab
)
Nested Table NOK_to Store AS NOK_Person_NTab;

CREATE TABLE Course_tab of Course_t (
primary key (COURSE_NO),
foreign key (Course_Dept_ref) references Department_tab
/*foreign key (Course_Staff_ref) references Faculty_tab_Sub*/
)
Nested Table Modules Store AS Course_Modules_NTab
Nested Table Enrolled_students Store AS Course_Students_NTab;

CREATE TABLE Student_tab_Sub of Student_typ_Sub (
primary key (STUDENT_NO),
foreign key (Student_Course_ref) references Course_tab,
foreign key (Student_TAddress) references Address_tab
/*foreign key (Student_Tutor_ref) references Faculty_tab_Sub */
)
Nested Table Marks Store AS Student_Modules_NTab
Nested Table Study Store AS Modules_Ntab;

CREATE TABLE Faculty_tab_Sub of Faculty_typ_Sub (
primary key (STAFF_NO)
)
Nested Table Courses_led Store AS Faculty_Course_Leaders_NTab
Nested Table Modules_tutored Store AS Faculty_Module_Tutors_NTab
Nested Table Students_tutored Store AS Faculty_Student_Tutors_NTab
Nested Table Teach_respons Store AS Faculty_Teaching_NTab
Nested Table Dept_chair Store AS Faculty_Dept_Chair_NTab;

CREATE TABLE Module_tab of Module_t (
primary key (MODULE_NO),
foreign key (Tutors_ref) references Faculty_tab_Sub
)
Nested Table Courses Store AS Modules_Course_NTab
Nested Table Lecturers Store AS Module_Faculty_NTab
Nested Table Student_Marks Store AS Students_Marks_NTab
Nested Table Students Store AS Module_Students_Ntab;

CREATE TABLE Teaching_tab of Teaching_t (
foreign key (FK_Staff) references Faculty_tab_Sub,
foreign key (FK_Staff_Modules) references Module_tab
);

CREATE TABLE Student_Modules_tab of Student_Modules_t (
foreign key (FK_Student) references Student_tab_Sub,
foreign key (FK_Student_Modules) references Module_tab
);

CREATE TABLE Chair_tab of Chair_t (
foreign key (FK_Chair_Dept) references Department_tab,
foreign key (FK_Chair_Professor) references Faculty_tab_Sub
);

ALTER TABLE Department_tab Add constraint Prim_Address_ref_FK
foreign key (Prim_Address) references Address_tab;
ALTER TABLE Department_tab Add constraint Sec_Address_ref_FK
foreign key (Sec_Address) references Address_tab;
ALTER TABLE Student_tab_Sub Add constraint Student_Tutor_ref_FK 
foreign key (Student_Tutor_ref) references Faculty_tab_Sub;
ALTER TABLE Course_tab Add constraint Course_Staff_ref_FK
foreign key (Course_Staff_ref) references Faculty_tab_Sub;











