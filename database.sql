1> CREATE DATABASE university_db;

2> CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL
)

3> CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50) NOT NULL,
    credits INT NOT NULL DEFAULT 3,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
)

4> CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL
)

5> CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
)

6> CREATE TABLE health_records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    blood_group VARCHAR(3)
)
7> 1> INSERT INTO departments VALUES
        (NULL, 'computer science'),
        (NULL, 'mathematics'),
        (NULL, 'physics')

    2> INSERT INTO courses VALUES
        (NULL, 'database systems' , 4 , 1),
        (NULL, 'algorithms' , 3 , 1),
        (NULL, 'calculus' , 4 , 2),
        (NULL, 'quantum mechanics ', 5 , 3)

    3>INSERT INTO students VALUES
        (NULL,'alice'),
        (NULL,'bob'),
        (NULL,'charlie'),
        (NULL,'samy'),
        (NULL,'eva');

    4>INSERT INTO enrollments(student_id, course_id) VALUES
        (1, 1),
        (1, 2),
        (2, 1),
        (3, 2),
        (3, 3),
        (4, 3),
        (4, 4);

    5> INSERT INTO health_records( student_id, blood_group) values
        (1, 'A+'),
        (2, 'B+'),
        (3, 'O-'),
        (4, 'AB+'),
        (5, 'A-');

8> 1>   SELECT * FROM students INNER JOIN health_records
        ON students.student_id = health_records.student_id

    2>  SELECT students.student_name, courses.course_name 
            FROM students 
            INNER JOIN enrollments 
            ON students.student_id = enrollments.student_id
            INNER JOIN courses 
            ON enrollments.course_id = courses.course_id

9> SELECT *
            FROM students 
            LEFT JOIN enrollments 
            ON students.student_id = enrollments.student_id
            LEFT JOIN courses 
            ON enrollments.course_id = courses.course_id

10> SELECT *
            FROM students 
            RIGHT JOIN enrollments 
            ON students.student_id = enrollments.student_id
            RIGHT JOIN courses 
            ON enrollments.course_id = courses.course_id