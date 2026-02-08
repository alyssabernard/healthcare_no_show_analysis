 WITH repeat_patients AS (
SELECT 
  patient_id,
  COUNT(*) AS no_show_status
FROM `cloudysanfrancisco-480317.healthcare.appointments`
WHERE status = 'No-Show'
GROUP BY patient_id
HAVING COUNT(*) >= 2
)
SELECT
  a.patient_id,
  a.appointment_date,
  rp.no_show_status
FROM `cloudysanfrancisco-480317.healthcare.appointments` a
JOIN repeat_patients rp
ON a.patient_id = rp.patient_id
WHERE a.status = 'No-Show'
ORDER BY a.patient_id, a.appointment_date;

--In this query, I expanded on the repeat no-show analysis by identifying the specific dates when repeat patients missed appointments. I created a CTE (repeat_patients) that reuses the previous logic to find patients with two or more no-shows. Using a CTE keeps the query organized and avoids nesting extra subqueries. Next, I selected each repeat patient’s patient_id, the appointment_date of each missed appointment, and the patient’s total number of no-shows (no_show_status) to provide additional context. I joined the repeat_patients CTE back to the main appointments table on patient_id, filtered the results to only include rows where status = 'No-Show', and ordered by patient_id and appointment_date so each patient’s no-show history appears together in chronological order.
