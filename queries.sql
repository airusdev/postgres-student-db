-- number of students enrolled in each course
-- course capacity is 100

SELECT
    course_name,
    course_takers

FROM courses;

-- Names of students enrolled in a specific course

SELECT
    courses.course_name,
    students.student_name
FROM courses
INNER JOIN enrollments


ON enrollments.course_id = courses.course_id, enrollments.student_id = students.student_id;

