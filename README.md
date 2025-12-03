# Murder-Mystery-SQL-Project

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

1️⃣ _**Understanding the Database Schema**_

Reviewed multiple tables containing:
Crime reports
Person and address records
Witness statements
Vehicle registrations
Event logs

2️⃣ _**Identifying the First Clue**_

Used the initial evidence to narrow down:
Crime location
Date & time
Potential witnesses

3️⃣ _**Interviews & Evidence Tracking**_

Queried witness statements to identify:
Descriptions of suspects
Vehicles involved
Movements around crime time

4️⃣ _**Narrowing Down the Suspect List**_

Cross-referenced:
Person appearance
Residency
License plates
Known associates

5️⃣ _**Final Identification**_

Using all evidence, determined the final suspect, their motive, and related proof.

📊 Sample SQL Techniques Used
-- Example: Using CTEs to track evidence step-by-step

WITH liars AS (
    SELECT 
        a.employee_id,
        e.name,
        a.claimed_location AS claimed_location,
        kl.room AS real_location,
        kl.entry_time
    FROM alibis a
    JOIN keycard_logs kl 
       ON a.employee_id = kl.employee_id
       AND a.claim_time BETWEEN kl.entry_time AND kl.exit_time
    JOIN employees e ON e.employee_id = a.employee_id
    WHERE kl.room != a.claimed_location
),

office_visitors AS (
    SELECT 
        kl.employee_id,
        kl.room,
        kl.entry_time
    FROM keycard_logs kl
    WHERE kl.room = 'CEO Office'
)

SELECT 
    e.employee_id,
    e.name,
    e.department,
    e.role,

    c.call_time AS suspicious_call_time,
    l.claimed_location AS lied_about_location,
    l.real_location AS actual_location,

    ov.entry_time AS time_entered_ceo_office,
    ev.description AS evidence_found
FROM employees e

LEFT JOIN calls c
    ON e.employee_id = c.caller_id
    OR e.employee_id = c.receiver_id

LEFT JOIN liars l
    ON e.employee_id = l.employee_id

LEFT JOIN office_visitors ov
    ON e.employee_id = ov.employee_id

LEFT JOIN evidence ev
    ON ev.room = 'CEO Office'

WHERE c.call_time IS NOT NULL
   OR l.employee_id IS NOT NULL
   OR ov.employee_id IS NOT NULL

ORDER BY c.call_time DESC NULLS LAST;


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
