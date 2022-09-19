USE company;

SELECT * FROM courses;

/* Data Types */
/* Create a new table for courses */

CREATE TABLE courses_new(
course_id int NOT NULL,
course_name varchar(30) NOT NULL,
course_duration_months decimal(3,1) NOT NULL,
PRIMARY KEY(course_id)
);

/* Add new column into the table */
ALTER TABLE courses_new ADD course_fee int NOT NULL;
DESC courses_new;

/* decimal(3,1) -> Total 3 digits one is after decimal point 12.5, 3.5, 25.9 */
INSERT INTO courses_new VALUES(1, 'Big Data', 6.5, 50000),
(2,'Web Development', 4.6, 25000),
(3, 'Data Mining', 3.2, 21000),
(4, 'Data Structrures', 6, 45000);

/* Add new row to Table */
INSERT INTO courses_new VALUES(4, 'Data Structrures', 6, 45000);
SELECT * FROM courses_new;

DROP TABLE courses_new;
/* Add stamp to rows creation time */

CREATE TABLE courses_new(
course_id int NOT NULL,
course_name varchar(30) NOT NULL,
course_duration_months decimal(3,1) NOT NULL,
course_fee int NOT NULL,
changed_at TIMESTAMP DEFAULT NOW(), 
PRIMARY KEY(course_id)
);

INSERT INTO courses_new (course_id, course_name, course_duration_months, course_fee) 
VALUES(1, 'Big Data', 6.5, 50000),
(2,'Web Development', 4.6, 25000),
(3, 'Data Mining', 3.2, 21000),
(4, 'Data Structrures', 6, 45000);

SELECT * FROM courses_new;

UPDATE courses_new SET course_fee = 20000 WHERE course_id = 1;

INSERT INTO courses_new (course_id, course_name, course_duration_months, course_fee) 
VALUES(5, 'DevOps', 3.5, 10000);

/* adding current time stamp on updating row */
CREATE TABLE courses_new(
course_id int NOT NULL,
course_name varchar(30) NOT NULL,
course_duration_months decimal(3,1) NOT NULL,
course_fee int NOT NULL,
changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(), 
PRIMARY KEY(course_id)
);

INSERT INTO courses_new (course_id, course_name, course_duration_months, course_fee) 
VALUES(1, 'Big Data', 6.5, 50000),
(2,'Web Development', 4.6, 25000),
(3, 'Data Mining', 3.2, 21000),
(4, 'Data Structrures', 6, 45000);

SELECT * FROM courses_new;

INSERT INTO courses_new (course_id, course_name, course_duration_months, course_fee) 
VALUES(5, 'DevOps', 3.5, 10000);

UPDATE courses_new SET course_fee = 20000 WHERE course_id = 1;