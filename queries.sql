-- number of students enrolled in each course
-- course capacity is 100

SELECT
    course_name,
    course_takers

FROM courses;


-- Names of students enrolled in a specific course
    -- complete list of names
SELECT
    students.student_name,
    courses.courses_name

FROM enrollments
INNER JOIN students ON enrollments.student_id = students.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id
ORDER BY students.student_name;

    -- specific course
SELECT
    courses.course_name,
    students.student_name

FROM enrollments
INNER JOIN students ON enrollments.student_id = students.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'BSCS';


-- Courses with more than N students (3)
SELECT
    course_name,
    course_takers

FROM courses
WHERE course_takers > 3


-- Students who are enrolled in more courses than the average student.

SELECT
    students.student_name,
    COUNT(enrollments.course_id) AS per_student_course_count

FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id
GROUP BY students.student_name
HAVING COUNT(enrollments.course_id) > (
    SELECT COUNT(enrollments.course_id) * 1.0 / (SELECT COUNT(students.student_id) FROM students)
    FROM enrollments
)

ORDER BY students.student_name ASC;


-- Rank students within each course by enrollment date
SELECT
    courses.course_name,
    students.student_name,
    enrollments.date_enrolled,
    DENSE_RANK() OVER (
        PARTITION BY courses.course_name
        ORDER BY enrollments.date_enrolled
    ) AS rank_within_course

FROM enrollments
INNER JOIN students ON enrollments.student_id = students.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id
ORDER BY courses.course_name, enrollments.date_enrolled ASC;


-- Full roster: student name, course name, and enrollment date, across all three tables.
SELECT
    students.student_name,
    courses.course_name,
    enrollments.date_enrolled

FROM enrollments
INNER JOIN students ON enrollments.student_id = students.student_id
INNER JOIN courses ON enrollments.course_id = courses.course_id
ORDER BY students.student_name ASC;


-- Average number of enrollments per student (one number)
SELECT
    COUNT(enrollments.course_id) * 1.0 / (SELECT COUNT(students.student_id) FROM students) AS avg_enrollments_per_student

FROM enrollments;


-- Find courses whose enrollment count is greater than the average enrollment count per course.
SELECT
    course_name,
    course_takers

FROM courses
WHERE course_takers > (
    SELECT
        SUM(course_takers) * 1.0 / COUNT(course_id) AS avg_course_enrollment

    FROM courses
)
GROUP BY course_name, course_takers;

