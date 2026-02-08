WITH base AS (
  SELECT
  patient_id,
  appointment_date,
  scheduled_date,
  status,
      DATE_DIFF(appointment_date, scheduled_date, DAY) AS lead_days
  FROM `cloudysanfrancisco-480317.healthcare.appointments` a
),
bucketed AS (
SELECT
patient_id,
status,
lead_days,
CASE
  WHEN lead_days <=7 THEN '1-7 days'
  WHEN lead_days <=14 THEN '8-14 days'
  WHEN lead_days <=21 THEN '15-21 days'
  ELSE '22+ days' 
  END AS lead_time_bucket
FROM base
)

SELECT
  lead_time_bucket,
  COUNT(*) AS total_appointments,
  COUNTIF(bucketed.status = 'No-Show') AS no_show,
  SAFE_DIVIDE(COUNTIF(bucketed.status = 'No-Show'), COUNT(*)) AS rate_of_no_shows
FROM bucketed
GROUP BY lead_time_bucket
ORDER BY
  CASE lead_time_bucket
    WHEN '1-7 days' THEN 1
    WHEN '8-14 days' THEN 2
    WHEN '15-21 days' THEN 3
    WHEN '22+ days' THEN 4
    ELSE 99
  END;

--In this query I wanted to anaylze whether or not how far advance you book an appointment relates to the rate of no shows. To do this, I first had to create a BASE that I would continously pull from instead of having to rewrite the formulas over and over again. In my BASE formula, I was finding the difference between the date of an appointment and the date that appointment was scheduled. This would give me my lead time. Then, I created a bucketed version of lead time. I decided to break it into 7 day increments. Then, to finally find the rate, I used the COUNT function to total all of the appointments, the COUNTIF function to only count the no-shows, and then I used SAFE_DIVIDE to divide the no shows by the total number of appointments. I then grouped by lead_time_bucket and ordered by lead_time_bucket by using CASE.