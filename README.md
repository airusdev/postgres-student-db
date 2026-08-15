# Schema Design --- school-db

I separated the `school_db` into five sections:

1. **Students**
2. **Courses**
3. **Enrollments**
4. **School Inventory**
5. **Course Items**

Each table has a specific purpose, and the IDs are used to connect the tables to each other.

---

## 1. Students

The `students` table contains the information for each student.

| Column         | Description                            |
| -------------- | -------------------------------------- |
| `student_id`   | Unique identification for each student |
| `student_name` | Name associated with the student ID    |

Example:

| `student_id` | `student_name` |
| -----------: | -------------- |
|            1 | Oliver Hayes   |
|            2 | Clara Vance    |
|            3 | Julian Mercer  |

The `student_id` makes sure that each student can be uniquely identified, while `student_name` associates that ID with the student's name.

---

## 2. Courses

The `courses` table contains the information for each course.

| Column            | Description                                  |
| ----------------- | -------------------------------------------- |
| `course_id`       | Unique identification for each course        |
| `course_name`     | Name of the course                           |
| `course_capacity` | Original capacity of the course              |
| `course_takers`   | Current number of students taking the course |

Example:

| `course_id` | `course_name` | `course_capacity` | `course_takers` |
| ----------: | ------------- | ----------------: | --------------: |
|           1 | BSCS          |               100 |               2 |
|           2 | DMD           |               100 |               2 |
|           3 | BSME          |               100 |               4 |

Similar to the `students` table, `course_id` is used to uniquely identify each course.

---

## 3. Enrollments

The `enrollments` table records which students are enrolled in which courses and when they enrolled.

| Column          | Description                    |
| --------------- | ------------------------------ |
| `course_id`     | Identifies the course          |
| `student_id`    | Identifies the student         |
| `date_enrolled` | Date when the student enrolled |

Example:

| `course_id` | `student_id` | `date_enrolled` |
| ----------: | -----------: | --------------- |
|           1 |            1 | 2026-08-15      |
|           1 |            2 | 2026-09-12      |
|           2 |            1 | 2026-10-22      |
|           2 |            3 | 2026-08-04      |

The table only needs the IDs because the actual student and course information is already stored in the `students` and `courses` tables.

The important idea here is that **one student can have multiple enrollment rows** if they are enrolled in multiple courses.

For example:

| `course_id` | `student_id` | `date_enrolled` |
| ----------: | -----------: | --------------- |
|           1 |            1 | 2026-08-15      |
|           2 |            1 | 2026-10-22      |
|           4 |            1 | 2026-09-24      |
|           5 |            1 | 2026-10-11      |

Here, `student_id` **1** appears four times because the student is enrolled in four different courses.

The same idea works in reverse: **one course can have multiple students enrolled in it**.

So, instead of putting several course IDs inside one student row, each student-course relationship gets its own row.

---

## 4. School Inventory

The `school_inventory` table contains the items available in the school's inventory.

| Column           | Description                                   |
| ---------------- | --------------------------------------------- |
| `item_id`        | Unique identification for each inventory item |
| `item`           | Name of the item                              |
| `classification` | Classification of the item                    |
| `item_quantity`  | Quantity currently available                  |

Example:

| `item_id` | `item`            | `classification`       | `item_quantity` |
| --------: | ----------------- | ---------------------- | --------------: |
|         1 | Student Desk      | Classroom Furniture    |             450 |
|         2 | Whiteboard Marker | Instructional Supplies |             600 |
|         3 | Desktop Computer  | Technology Equipment   |             120 |

The `item_id` is used to uniquely identify each item in the school inventory.

---

## 5. Course Items

The `course_items` table connects courses to the items they require from the school inventory.

| Column      | Description                            |
| ----------- | -------------------------------------- |
| `course_id` | Identifies the course                  |
| `item_id`   | Identifies the required inventory item |

Example:

| `course_id` | `item_id` |
| ----------: | --------: |
|           1 |         3 |
|           2 |         2 |
|           3 |         1 |

This means:

* Course `1` requires inventory item `3` — **Desktop Computer**
* Course `2` requires inventory item `2` — **Whiteboard Marker**
* Course `3` requires inventory item `1` — **Student Desk**

The table only stores the IDs because the actual information about the course and inventory item is already stored in their respective tables.

---

## How the Tables Are Structured

The main idea behind the database is to keep each type of information in its own table and use IDs to connect related information.

The structure can be understood like this:

```text
students
    |
    | student_id
    v
enrollments
    ^
    | course_id
    |
courses
    |
    | course_id
    v
course_items
    ^
    | item_id
    |
school_inventory
```

### Students → Enrollments → Courses

The `enrollments` table connects students and courses.

For example:

```text
Student 1
    ├── Course 1
    ├── Course 2
    ├── Course 4
    └── Course 5
```

Instead of storing all of these courses inside the student's row, each relationship is stored as a separate row in `enrollments`.

This allows the same `student_id` to appear multiple times while each row represents a different course enrollment.

### Courses → Course Items → School Inventory

The `course_items` table works in a similar way.

It connects a course to the items that it requires from the school inventory.

For example:

```text
Course 1
    └── Item 3 (Desktop Computer)
```

The `course_items` table stores the relationship using `course_id` and `item_id`, while the actual course and item information remains in the `courses` and `school_inventory` tables.

Overall, the idea is to keep the tables separated by what information they represent, while using IDs to connect the related information between them.
