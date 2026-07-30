-- students table
INSERT INTO students
VALUES
(1, 'Oliver Hayes'),
(2, 'Clara Vance'),
(3, 'Julian Mercer'),
(4, 'Maya Lin'),
(5, 'Jasper Thorne'),
(6, 'Gavin Drake'),
(7, 'Fiona Beck'),
(8, 'Valerie Cruz');

-- courses table
INSERT INTO courses
VALUES
(1, 'BSCS', 100, 2),
(2, 'DMD', 100, 2),
(3, 'BSME', 100, 4);

-- enrollments
INSERT INTO enrollments
VALUES
(1, 1, '2026-08-13'),
(2, 1, '2026-08-14'),
(3, 3, '2026-10-15'),
(4, 2, '2026-9-14'),
(5, 3, '2026-10-16'),
(6, 3, '2026-10-13'),
(7, 3, '2026-10-14'),
(8, 2, '2026-9-13');

-- school invetory
INSERT INTO school_inventory
VALUES
('Student Desk', 'Classroom Furniture', 450),
('Whiteboard Marker', 'Instructional Supplies', 600),
('Desktop Computer', 'Technology Equipment', 120);
