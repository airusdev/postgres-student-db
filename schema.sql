CREATE TABLE students (
    student_id int,
    student_name varchar(80)
);

CREATE TABLE courses (
    course_id int,
    course_name varchar(80),
    course_capacity int,
    course_takers int
);

CREATE TABLE enrollments (
    course_id int,
    student_id int,
    date_enrolled date
);

CREATE TABLE school_inventory (
    item_id int,
    item varchar(80),
    classification varchar(80),
    item_quantity int
);

CREATE TABLE course_items (
    course_id int,
    item_id int
);
