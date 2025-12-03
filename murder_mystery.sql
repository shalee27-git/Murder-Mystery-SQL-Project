-- WITH suspects AS (
-- SELECT k1.employee_id, k1.entry_time, k1.exit_time
-- FROM keycard_logs k1
-- WHERE k1.room = 'CEO Office' AND k1.entry_time <= '2025-10-15 21:00:00'
-- AND k1.exit_time >= '2025-10-15 21:00:00'
-- )
-- select * from suspects

-- WITH suspicious_calls as (
-- select caller_id, receiver_id, call_time from calls
-- where call_time between '2025-10-15 20:45:00' and '2025-10-15 21:00:00'
-- ) select * from suspicious_calls;

-- with alibi_logs as (
-- select a.employee_id, a.claimed_location, a.claim_time
-- from alibis a
-- ) select * from alibi_logs;


WITH liars AS (
    SELECT 
        a.employee_id,
        e.name,
        a.claimed_location AS claimed_location,
        kl.room AS real_location,
        kl.entry_time,
        kl.exit_time,
        a.claim_time
    FROM alibis a
    JOIN keycard_logs kl 
        ON a.employee_id = kl.employee_id
        AND a.claim_time BETWEEN kl.entry_time AND kl.exit_time
    JOIN employees e 
        ON e.employee_id = a.employee_id
    WHERE kl.room != a.claimed_location
)
SELECT * FROM liars;


-- with crime_evidence as (
-- select room, description, found_time
-- from evidence
-- where room = 'CEO Office'
-- and found_time between '2025-10-15 21:00:00' and '2025-10-15 23:00:00'
-- ) select * from crime_evidence;


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














