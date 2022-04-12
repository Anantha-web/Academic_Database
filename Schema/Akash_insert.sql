INSERT INTO ASSIGNMENT_EVALS
VALUES
('x@gmail.com','https://cs001/A/1','xa@gmail.com',76,TRUE,'https://github.com/a/1','Partial'),
('x@gmail.com','https://cs001/A/2','xa@gmail.com',77,FALSE,'https://github.com/a/2','Partial'),
('x@gmail.com','https://cs001/A/3','xa@gmail.com',78,TRUE,'https://github.com/a/3','Partial'),
('z@gmail.com','https://cs001/A/1','yb@gmail.com',79,FALSE,'https://github.com/a/4','Partial'),
('z@gmail.com','https://cs001/A/2','yb@gmail.com',80,TRUE,'https://github.com/a/5','Partial'),
('z@gmail.com','https://cs001/A/3','yb@gmail.com',81,FALSE,'https://github.com/a/6','Partial'),
('x@gmail.com','https://cs004/A/1','le@gmail.com',82,FALSE,'https://github.com/a/7','Partial'),
('x@gmail.com','https://cs004/A/2','le@gmail.com',83,TRUE,'https://github.com/a/8','Partial'),
('y@gmail.com','https://cs004/A/1','mf@gmail.com',84,FALSE,'https://github.com/a/9','Partial'),
('y@gmail.com','https://cs004/A/2','mf@gmail.com',85,TRUE,'https://github.com/a/10','Partial'),
('x@gmail.com','https://cs005/A/1','ds@gmail.com',86,FALSE,'https://github.com/a/11','Partial'),
('y@gmail.com','https://cs005/A/1','ds@gmail.com',87,TRUE,'https://github.com/a/12','Partial');




INSERT INTO Assignment
VALUES
('CS_001',TO_DATE('07-09-2021','DD-MM-YYYY'),TO_DATE('16-10-2021','DD-MM-YYYY'),8,'https://cs001/A/1'),
('CS_001',TO_DATE('07-09-2021','DD-MM-YYYY'),TO_DATE('16-10-2021','DD-MM-YYYY'),7,'https://cs001/A/2'),
('CS_001',TO_DATE('07-09-2021','DD-MM-YYYY'),TO_DATE('16-10-2021','DD-MM-YYYY'),7,'https://cs001/A/3'),
('CS_004',TO_DATE('07-09-2021','DD-MM-YYYY'),TO_DATE('16-10-2021','DD-MM-YYYY'),8,'https://cs004/A/1'),
('CS_004',TO_DATE('07-09-2021','DD-MM-YYYY'),TO_DATE('16-10-2021','DD-MM-YYYY'),8,'https://cs004/A/2'),
('CS_005',TO_DATE('07-09-2021','DD-MM-YYYY'),TO_DATE('16-10-2021','DD-MM-YYYY'),8,'https://cs005/A/1');

INSERT INTO QUIZ
VALUES
('CS_001','Code Tantra',TO_DATE('16-10-2021','DD-MM-YYYY'),10:00:00,10:45:00),
('CS_001','Code Tantra',TO_DATE('17-10-2021','DD-MM-YYYY'),09:00:00,10:00:00),
('CS_002','Moodle',TO_DATE('18-10-2021','DD-MM-YYYY'),9:00,09:45:00,11:00:00),
('CS_002','Moodle',TO_DATE('19-10-2021','DD-MM-YYYY'),10:00:00,10:30:00),
('CS_002','Code Tantra',TO_DATE('11-10-2021','DD-MM-YYYY'),12:00:00,01:00:00),
('CS_004','Code Tantra',TO_DATE('12-10-2021','DD-MM-YYYY'),03:00:00,03:45:00),
('CS_005','Moodle',TO_DATE('13-10-2021','DD-MM-YYYY'),11:00:00,11:45:00);

INSERT INTO QUIZ_EVALS
VALUES
('x@gmail.com',TO_DATE('16-10-2021','DD-MM-YYYY'),'CS_001','xa@gmail.com',74,TRUE,'https://cs001/Q211121/x','Q4 only 4 points given.'),
('x@gmail.com',TO_DATE('11-10-2021','DD-MM-YYYY'),'CS_005','ds@gmail.com',100,TRUE,'https://cs005/Q281021/x','Not applicable'),
('y@gmail.com',TO_DATE('12-10-2021','DD-MM-YYYY'),'CS_002','zc@gmail.com',100,FALSE,'https://cs02/Q151121/y', 'Not applicable'),
('y@gmail.com',TO_DATE('13-10-2021','DD-MM-YYYY'),'CS_004','le@gmail.com',90,TRUE,'https://cs04/131121/y', 'Q1 not written'),
('z@gmail.com',TO_DATE('14-10-2021','DD-MM-YYYY'),'CS_001','yb@gmail.com',99,FALSE,'https://cs01/Q211121/z','Q5 spelling mistake');

INSERT INTO TAship
VALUES
(02:00:00,'xa@gmail.com','CS_001'),
(02:00:00,'yb@gmail.com','CS_001'),
(02:00:00,'zc@gmail.com','CS_002'),
(02:00:00,'kd@gmail.com','CS_002'),
(02:00:00,'le@gmail.com','CS_004'),
(02:00:00,'mf@gmail.com','CS_004'),
(02:00:00,'ds@gmail.com','CS_005');

