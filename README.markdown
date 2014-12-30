#Spring-MVC-AJAX-Integration
===========
This repository contains three examples of Spring MVC with AJAX Integration. Example 1 shows Auto-loading of cities when state is selected from drop-down box using AJAX, Example 2 shows Auto-loading of country details when country is selected from drop-down box using AJAX, and Example 3 shows Validations in Spring MVC and submitting form using AJAX.

###Import the project in Eclipse
1. Ensure Maven is installed
2. Open a command window (Windows) or a terminal (Linux/Mac)
3. Run the following command:

	mvn eclipse:eclipse -Dwtpversion=2.0

###Building with Maven
1. Ensure Maven is installed
2. Open a command window (Windows) or a terminal (Linux/Mac)
3. Run the following command:

	mvn tomcat:run
	
And browse to [http://localhost:8080/springajaxintegration/](http://localhost:8080/springajaxintegration/).![Build Status](http://i1272.photobucket.com/albums/y389/harshal091/passing_zpsb61e9184.png?t=1408901662)

####Main Form####
![Screenshot](http://i1272.photobucket.com/albums/y389/harshal091/MainForm_zps40dbdd16.png)

####Example 1 (Auto-loading of cities when state is selected from drop-down box using AJAX)####
![Screenshot](http://i1272.photobucket.com/albums/y389/harshal091/Example1_zps6d2cc866.png)

####Example 2 (Auto-loading of country details when country is selected from drop-down box using AJAX)####
![Screenshot](http://i1272.photobucket.com/albums/y389/harshal091/Example2_zpsc59d0359.png)

#### Example3 (Validations in Spring MVC and submitting form using AJAX)####

![Screenshot](http://i1272.photobucket.com/albums/y389/harshal091/Example3FailedValidations_zpsb0e5fe01.png)

![Screenshot](http://i1272.photobucket.com/albums/y389/harshal091/Example3PassedValidations_zpsf1a689ef.png)

![Screenshot](http://i1272.photobucket.com/albums/y389/harshal091/Example3AJAXsubmit_zpsc055989a.png)

##Downloads
Source is hosted at the [Spring-MVC-AJAX-Integration GitHub repository](https://github.com/shivam091/Spring-MVC-AJAX-Integration.git). 
Downloads are also available on the [GitHub project's Downloads section] (https://github.com/shivam091/Spring-MVC-AJAX-Integration/archive/master.zip)

##Dependencies
######javax.servlet-api:3.0.4
######servlet-api:2.5
######jsp-api:2.1
######jstl:1.2
######cglib-nodep:2.2
######commons-dbcp:1.4
######javassist:3.12.1.GA
######jackson-mapper-asl:1.9.9
######jackson-core-asl:1.9.9
######jackson-databind:2.3.2
######jackson-annotations:2.3.0
######spring-context:4.0.1.RELEASE
######spring-core:4.0.1.RELEASE
######spring-web:4.0.1.RELEASE
######spring-webmvc:4.0.1.RELEASE
######spring-orm:4.0.1.RELEASE
######spring-tx:4.0.1.RELEASE
######spring-jdbc:4.0.1.RELEASE
######spring-test:4.0.1.RELEASE
######spring-data-jpa:1.4.1.RELEASE
######hibernate-entitymanager:4.3.5.Final
######hibernate-core:3.6.5.Final
######hibernate-validator:4.1.0.Final
######mysql-connector-java:5.1.22
######dom4j:1.5
######commons-io2.4
######commons-fileupload:1.3

1. Write AR Query to display names of all the courses and it's cost in descending order.
Query:

2. Write AR Query to display all Prof. Meheta's students from Engineering Department.
Query:

3. Write AR Query to display the count of all the students of every course where course name is listed in ascending order
Query:

4. Write AR Query to count the number of students from Engineering Department whose course fees are remaining .
Query:

5. Write AR Query to display all the details of all the professors of medical department.
Query:

6. Write AR Query to display full name of all the students who have taken Computers course.
Query:

7. Write AR Query to display all the 'A grade' students from  III rd semester of engineering.
Query:

8. Write AR Query to display all name of all the courses and start time of every section along with the full name of the professor.
Query:

9. Write AR Query to display details of all the employees and their department name in descending order of their department name.
Query:

10. Write AR Query to display the all students from first year of Engineering.
Query:

11. Write AR Query to display names of all the departments and cost of all it's courses. 
Query:

12. Write AR Query to count fees paid by all the students for every course during year 2012
Query:

13. Write AR Query to count fees collected for every course during all the years and list the details in ascending order of year
Query:


CREATE TABLE students (
  student_id int PRIMARY KEY,
  first_name varchar(20),
  last_name varchar(20),
  address varchar(50),
  city varchar(20),
  state varchar(30),
  postal_code varchar(8),
  country varchar(20),
  phone_number varchar(10),
  email_address varchar(30),
  graduation_year smallint
);

INSERT INTO students VALUES(1, 'Harshal', 'Ladhe', 'New Panvel', 'Navi Mumbai', 'MH', '410206',
    'India', '9255565566', 'harshalladhe@live.com', 2014);
INSERT INTO students VALUES(2, 'Purva', 'S', 'Sanpada', 'Navi Mumbai', 'MH', '400705',
    'India', '5554755455', 'purvas@live.com', 2013);
INSERT INTO students VALUES(3, 'Monali', 'U', 'Kalwa', 'Thane', 'MH', '400605',
    'India', '5656555665', 'monaliu@live.com', 2013);

CREATE TABLE student_transactions (
  transaction_id int PRIMARY KEY,
  student_id int references students(student_id),
  post_date date,
  amount varchar(10),
  description varchar(50)
);

INSERT INTO student_transactions VALUES(1, 1, '12/20/2014', '10000', 'Second Semester Fees');
INSERT INTO student_transactions VALUES(2, 1, '05/24/2014', '25000', 'First Semester Fees');
INSERT INTO student_transactions VALUES(3, 2, '12/21/2014', '20000', 'Second Semester Fees');
INSERT INTO student_transactions VALUES(4, 3, '05/21/2014', '30000', 'First Semester Fees');
INSERT INTO student_transactions VALUES(5, 3, '12/25/2014', '15000', 'Second Semester Fees');
INSERT INTO student_transactions VALUES(6, 2, '05/22/2014', '35000', 'First Semester Fees');

CREATE TABLE enrollments (
  course_id int,
  section varchar(30) PRIMARY KEY,
  student_id int references students(student_id)
);

INSERT INTO enrollments VALUES (1, 'Header', 1);
INSERT INTO enrollments VALUES (2, 'Footer', 1);
INSERT INTO enrollments VALUES (3, 'Navigation ', 2);
INSERT INTO enrollments VALUES (4, 'Menu', 2);
INSERT INTO enrollments VALUES (5, 'Side Panel', 2);

CREATE TABLE departments (
  dept_id int PRIMARY KEY,
  Description varchar(25)
);

INSERT INTO departments VALUES (1, 'Mechanical');
INSERT INTO departments VALUES (2, 'Computer Science');
INSERT INTO departments VALUES (3, 'Electronics');
INSERT INTO departments VALUES (4, 'I.T.');

CREATE TABLE courses (
  course_id int PRIMARY KEY,
  department_id int references departments(dept_id),
  name varchar(10),
  units varchar(10),
  cost varchar(10),
  capacity int
);

INSERT INTO courses VALUES (1, 2, 'M.Sc.', '2', 35000, 20);
INSERT INTO courses VALUES (2, 3, 'B.E.', '2', 89000, 20);
INSERT INTO courses VALUES (3, 4, 'B.Sc.', '2', 22000, 80);
INSERT INTO courses VALUES (4, 1, 'B.E.', '2', 92000, 20);

CREATE TABLE grades (
  student_id int references students(student_id),
  course_id int references courses(course_id),
  year smallint,
  semester smallint,
  grade varchar(10)
);

INSERT INTO grades VALUES (1, 1, 2014, 1, 'A');
INSERT INTO grades VALUES (2, 2, 2014, 4, 'B');
INSERT INTO grades VALUES (3, 3, 2013, 2, 'O');

CREATE TABLE employees (
  employee_id int PRIMARY KEY,
  first_name varchar(20),
  last_name varchar(20),
  address varchar(50),
  city varchar(20),
  state varchar(20),
  postal_code varchar(8),
  country varchar(20),
  phone_number varchar(10),
  salary varchar(10),
  department_id int references departments(dept_id)
);

INSERT INTO employees VALUES(1, 'Sushant', 'P.', 'Dadar', 'Mumbai', 'MH', 400011, 'India',
    '2225556669', '19000', 1);
INSERT INTO employees VALUES(2, 'Neha', 'Y.', 'Mahim', 'Mumbai', 'MH', 400016, 'India',
    '5555556985', '52000', 3);
INSERT INTO employees VALUES(3, 'Ravidra', 'U.', 'Worli', 'Mumbai', 'MH', 400014, 'India',
    '2533256652', '24000', 2);

CREATE TABLE sections (
  course_id int references courses(course_id),
  section varchar(30) references enrollments(section),
  days smallint,
  start_time date,
  length varchar(20),
  professor_id int references employees(employee_id)
);

INSERT INTO sections VALUES (1, 'Header', 2, '12/22/2014', 150, 1);
INSERT INTO sections VALUES (2, 'Side Panel', 5, '12/22/2014', 190, 1);
INSERT INTO sections VALUES (3, 'Footer', 1, '12/22/2014', 180, 1);
