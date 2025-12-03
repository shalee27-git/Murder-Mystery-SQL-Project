# Murder-Mystery-SQL-Project

**Title: SQL Murder Mystery – Investigative Analytics Using Advanced SQL**

🕵️‍♀️ **SQL Murder Mystery – Investigative Data Analysis Using SQL**
📌 **Project Overview**

The SQL Murder Mystery is a popular investigative SQL challenge that simulates solving a mystery using only database clues.
In this project, I used advanced SQL techniques to analyze tables, uncover hidden relationships, and ultimately identify the murderer, eyewitness details, motive, and timeline.

This project demonstrates my ability to think analytically, apply SQL skills in real-case scenarios, and break down ambiguous problems into structured, logical steps.

🎯 **Objectives**

Use SQL to investigate a fictional crime scene
Perform structured query exploration to follow evidence trails
Apply joins, CTEs, filtering, subqueries, aggregations
Document reasoning at each step
Arrive at the final culprit using data-driven logic

🛠️ **Tech Stack**

SQL (CTEs, JOINs, Aggregations, Subqueries)
DB Browser / SQLite (or the platform you used)

🔍 **Skills Demonstrated**

Complex problem solving
Logical investigation workflow
Writing highly optimized SQL queries
Using CTEs for step-by-step traceability
Deep data exploration & pattern identification
Ability to work with multiple relational tables

📁 **Project Workflow**

1️⃣ Understanding the Database Schema

Reviewed multiple tables containing:
Crime reports
Person and address records
Witness statements
Vehicle registrations
Event logs

2️⃣ Identifying the First Clue

Used the initial evidence to narrow down:
Crime location
Date & time
Potential witnesses

3️⃣ Interviews & Evidence Tracking

Queried witness statements to identify:
Descriptions of suspects
Vehicles involved
Movements around crime time

4️⃣ Narrowing Down the Suspect List

Cross-referenced:
Person appearance
Residency
License plates
Known associates

5️⃣ Final Identification

Using all evidence, determined the final suspect, their motive, and related proof.

📊 Sample SQL Techniques Used
-- Example: Using CTEs to track evidence step-by-step
WITH crime_scene AS (
    SELECT *
    FROM crime_report
    WHERE date = '2018-01-15' AND city = 'SQL City'
),
witness_info AS (
    SELECT *
    FROM interviews
    WHERE person_id IN (SELECT witness_id FROM crime_scene)
)
SELECT *
FROM witness_info;

-- Example: Identifying a suspect from cross-linked records
SELECT p.name, p.address, v.plate_number
FROM person p
JOIN vehicle v ON p.person_id = v.owner_id
WHERE v.plate_number LIKE '%H42%';

📝 **Final Outcome**

✔ Successfully solved the SQL Murder Mystery
✔ Found the killer, supporting evidence, and final narrative
✔ Documented the entire analytical reasoning process
✔ Showcased SQL problem-solving skills in an investigation-style dataset

📂 **Repository Contents**

queries/ – Step-by-step SQL queries
screenshots/ – Output from investigation
solution.sql – Final working solution
README.md – Project documentation

🚀 **Why This Project Matters**

This project is a strong demonstration of:
Real-world SQL investigation
Query-driven storytelling
Analytical decision making
Ability to independently solve complex problems
