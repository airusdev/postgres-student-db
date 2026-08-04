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
(8, 'Valerie Cruz'),
(9, 'Ethan Brooks'),
(10, 'Nina Foster'),
(11, 'Caleb Monroe'),
(12, 'Isla Bennett'),
(13, 'Rowan Ellis');

-- courses table
INSERT INTO courses
VALUES
(1, 'BSCS', 100, 2),
(2, 'DMD', 100, 2),
(3, 'BSME', 100, 4);

-- enrollments
INSERT INTO enrollments
VALUES
(1, 1, '2026-08-15'),
(2, 1, '2026-09-12'),
(1, 2, '2026-10-22'),
(3, 2, '2026-08-04'),
(2, 3, '2026-09-01'),
(3, 4, '2026-08-19'),
(1, 4, '2026-09-24'),
(1, 5, '2026-10-11'),
(3, 5, '2026-08-30'),
(2, 5, '2026-09-15'),
(2, 6, '2026-08-11'),
(3, 7, '2026-10-05'),
(1, 7, '2026-08-27'),
(3, 8, '2026-09-08');

-- school inventory
INSERT INTO school_inventory
VALUES
('Student Desk', 'Classroom Furniture', 450),
('Whiteboard Marker', 'Instructional Supplies', 600),
('Desktop Computer', 'Technology Equipment', 120);