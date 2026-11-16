CREATE TABLE students (
    student_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_name TEXT NOT NULL,

    CONSTRAINT stud_name_not_empty CHECK (btrim(student_name) != ''),   
    CONSTRAINT stud_name_only_letters CHECK (student_name ~ '^[a-zA-Z ]+$')
);

CREATE TABLE courses (
    course_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_name TEXT NOT NULL,
    course_capacity BIGINT NOT NULL,
    course_takers BIGINT NOT NULL,

    CONSTRAINT course_not_empty CHECK (btrim(course_name) != ''),
    CONSTRAINT course_no_numbers CHECK (course_name ~ '^[a-zA-Z ]+$'),
    CONSTRAINT capacity_greater_than_zero CHECK (course_capacity != 0),
    CONSTRAINT takers_greater_than_zero CHECK (course_takers != 0)
);

CREATE TABLE enrollments (
    course_id BIGINT,
    student_id BIGINT,
    date_enrolled DATE,

    CONSTRAINT course_id_greater_0 CHECK (course_id > 0),
    CONSTRAINT student_id_greater_0 CHECK (student_id > 0)
);

CREATE TABLE school_inventory (
    item_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    item TEXT,
    classification TEXT,
    item_quantity BIGINT 
);

CREATE TABLE course_items (
    course_id BIGINT,
    item_id BIGINT
);
