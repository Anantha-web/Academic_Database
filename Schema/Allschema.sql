create Table Professor
(
    Country varchar(100),
    City varchar(100),
    pin_code varchar(20),
    Web_page varchar(150) not null,
    first_Name varchar(100),
    last_Name varchar(100),
    primary key (Web_page)
);

create Table ProfEmail
(
    Web_page varchar(150) not null,
    Email varchar(100), 
    primary key (Web_page)
);

create Table Proflab
(
    Web_page varchar(150) not null,
    Research_Labs  varchar(20),
    primary key (Web_page)
);


create Table Student
(
    first_Name varchar(100),
    last_Name varchar(100),
    Roll int,
    Email varchar(100) not null,
    primary key (Email)
);

create Table TA
(
    Email varchar(100) not null,
    first_Name varchar(100),
    last_Name varchar(100),
    primary key (Email)
);
   

create Table Course
(
    Course_ID varchar(20) not null,
    Which_semester_offered ENUM('mansoon', 'spring'),
    primary key (Course_ID)
);

create Table Acad_Admin
(
    Id int not null,
    first_Name varchar(100),
    last_Name varchar(100),
    primary key (Id)
);

create Table AcadQualification
(
    Id int not null,
    Qualification varchar(100),
    primary key (Id)
);


CREATE TABLE Studentship(
Attendence int NOT NULL,
student_email varchar(100) NOT NULL,
Course_ID varchar(20),
PRIMARY KEY(student_email,Course_ID)
);

CREATE TABLE Professorship(
Webpage varchar(150) NOT NULL,
Course_ID varchar(20) NOT NULL,
PRIMARY KEY(Webpage,Course_ID)
);

CREATE TABLE TAship(
TA_hours TIME NOT NULL,
TA varchar(100) NOT NULL,
Course_ID varchar(20) NOT NULL,
PRIMARY KEY(TA,Course_ID)
);

CREATE TABLE Quiz(
Course_ID varchar(20) NOT NULL,
Date_quiz DATE NOT NULL,
platform varchar(20) NOT NULL,
start_time TIME NOT NULL,
end_time TIME NOT NULL,
PRIMARY KEY(Course_ID, Date_quiz)
);

CREATE TABLE Assignment(
Course_ID varchar(20) NOT NULL,
Assignment_file varchar(150) NOT NULL,
Release_Date DATE NOT NULL,
End_Date DATE NOT NULL,
PRIMARY KEY(Course_ID,Assignment_file)
);


CREATE TABLE Project(
Course_ID varchar(20) NOT NULL,
Project_file varchar(150) NOT NULL,
Startdate DATE NOT NULL,
End_Date DATE NOT NULL,
Teamsize int NOT NULL,
PRIMARY KEY(Course_ID,Project_file)
);


CREATE TABLE prerequisites(
course varchar(20) NOT NULL,
prerequisite varchar(20),
PRIMARY KEY(course, prerequisite)
);



create Table MENTOR
(
    student_email varchar(100) not null,
    course_id varchar(20) not null,
    ta_email varchar(100),
    primary key(student_email, course_id)
);

create Table ASSIGNMENT_EVALS
(
    student_email varchar(100) not null,
    Assignment_file varchar(150) not null ,
    ta_email varchar(100),
    score int,
    verified boolean,
    submission varchar(150),
    remarks varchar(200),
    Course_ID varchar(20) not null,
    primary key(student_email, Assignment_file)
);

create Table PROJ_SUBMISSIONS
(
    student_email varchar(100) not null,
    Project_file varchar(150) not null,
    Submission varchar(150) ,
    Course_ID varchar(20) not null,
    primary key(student_email, Project_file)
);

create Table PROJ_EVALS
(
    student_email varchar(100) not null,
    Project_file varchar(150) not null,
    ta_email varchar(100),
    score int,
    verify boolean,
    remarks varchar(200),
    Course_ID varchar(20) not null,
    primary key(student_email, Project_file)
);



create Table QUIZ_EVALS
(
    student_email varchar(100) not null,
    Date_quiz date not null,
    course_id varchar(20) not null,
    ta_email varchar(100),
    score int,
    verified boolean,
    submission varchar(150) ,
    remarks varchar(200),
    primary key(student_email, Date_quiz)
);

create Table PROJ_TEAM
(
    student_email_1 varchar(100) not null,
    student_email_2 varchar(100),
    project_file varchar(150) not null,
    ta_email varchar(100),
    Course_ID varchar(20) not null,
    primary key(student_email_1, project_file)
);


ALTER TABLE ProfEmail ADD FOREIGN KEY (Web_page) REFERENCES  Professor(Web_page);
ALTER TABLE Proflab ADD FOREIGN KEY (Web_page) REFERENCES  Professor(Web_page);
ALTER TABLE AcadQualification ADD FOREIGN KEY (Id) REFERENCES  Acad_Admin(Id); 

ALTER TABLE Studentship ADD FOREIGN KEY (student_email) REFERENCES  Student(Email); 
ALTER TABLE Studentship ADD FOREIGN KEY (Course_ID) REFERENCES  Course(Course_ID); 
ALTER TABLE Professorship ADD FOREIGN KEY (Webpage) REFERENCES  Professor(Web_page); 
ALTER TABLE Professorship ADD FOREIGN KEY (Course_ID) REFERENCES  Course(Course_ID);
ALTER TABLE TAship ADD FOREIGN KEY (TA) REFERENCES  TA(Email);
ALTER TABLE TAship ADD FOREIGN KEY (Course_ID) REFERENCES  Course(Course_ID);
ALTER TABLE Assignment ADD FOREIGN KEY (Course_ID) REFERENCES  Course(Course_ID);
ALTER TABLE Quiz ADD FOREIGN KEY (Course_ID) REFERENCES  Course(Course_ID);
ALTER TABLE Project ADD FOREIGN KEY (Course_ID) REFERENCES  Course(Course_ID);
ALTER TABLE prerequisites ADD FOREIGN KEY (course) REFERENCES  Course(Course_ID); 
ALTER TABLE prerequisites ADD FOREIGN KEY (prerequisite) REFERENCES  Course(Course_ID); 

ALTER TABLE MENTOR ADD FOREIGN KEY (student_email) REFERENCES  Student(Email); 
ALTER TABLE MENTOR ADD FOREIGN KEY (course_id) REFERENCES  Course(Course_ID); 
ALTER TABLE MENTOR ADD FOREIGN KEY (ta_email) REFERENCES  TA(Email); 
ALTER TABLE ASSIGNMENT_EVALS ADD FOREIGN KEY (student_email) REFERENCES  Student(Email); 
ALTER TABLE ASSIGNMENT_EVALS ADD FOREIGN KEY (Course_ID, Assignment_file) REFERENCES  Assignment(Course_ID, Assignment_file);  
ALTER TABLE ASSIGNMENT_EVALS ADD FOREIGN KEY (ta_email) REFERENCES  TA(Email);
ALTER TABLE QUIZ_EVALS ADD FOREIGN KEY (student_email) REFERENCES  Student(Email); 
ALTER TABLE QUIZ_EVALS ADD FOREIGN KEY (ta_email) REFERENCES  TA(Email); 
ALTER TABLE QUIZ_EVALS ADD FOREIGN KEY (course_id, Date_quiz) REFERENCES  Quiz(Course_ID, Date_quiz); 


ALTER TABLE PROJ_TEAM ADD FOREIGN KEY (student_email_1) REFERENCES  Student(Email); 
ALTER TABLE PROJ_TEAM ADD FOREIGN KEY (student_email_2) REFERENCES  Student(Email); 
ALTER TABLE PROJ_TEAM ADD FOREIGN KEY (ta_email) REFERENCES  TA(Email); 
ALTER TABLE PROJ_TEAM ADD FOREIGN KEY (Course_ID, project_file) REFERENCES  Project(Course_ID, Project_file ); 
ALTER TABLE PROJ_SUBMISSIONS ADD FOREIGN KEY (student_email) REFERENCES  Student(Email); 
ALTER TABLE PROJ_SUBMISSIONS ADD FOREIGN KEY (Course_ID, Project_file) REFERENCES  Project(Course_ID, Project_file); 
ALTER TABLE PROJ_EVALS ADD FOREIGN KEY (student_email) REFERENCES  Student(Email); 
ALTER TABLE PROJ_EVALS ADD FOREIGN KEY (Course_ID,Project_file) REFERENCES  Project(Course_ID, Project_file); 
ALTER TABLE PROJ_EVALS ADD FOREIGN KEY (ta_email) REFERENCES  TA(Email); 
