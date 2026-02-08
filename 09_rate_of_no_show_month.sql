WITH monthly AS (
  SELECT
  DATE_TRUNC(appointment_date, MONTH) AS month,
  COUNT(*) AS all_appointments,
  COUNTIF(status = 'No-Show') AS no_show
FROM `cloudysanfrancisco-480317.healthcare.appointments` a
GROUP BY month
)
SELECT
  month,
  no_show,
  all_appointments,
SAFE_DIVIDE(no_show,all_appointments) AS rate_of_no_show_by_month
FROM monthly
ORDER BY month;

--In this query I wanted to analyze whether or not the month of the year played a role in no-shows. I started this query by creating a WITH clause to keep my data organized. I selected the month of my appointment by utilizing the DATE_TRUNC clause to organize the months. I debated between utilizing the DATE_TRUNC clause or the EXTRACT clause. Even though this data spans over only a year, I decided to go with the DATE_TRUNC function because I wanted to keep the months separated by year incase this data were to be updated in the database. I then used the COUNT(*) and COUNTIF clauses to count all of my appointments and my no shows. Then to find the rate, I selected my no shows, total appointments, and the month. I then used SAFE_DIVIDE to divide how many no shows to how many toal appointments.Finally, I ordered by month. If I wanted to order by rate_of_no_show,  I'd do ORDER BY rate_of_no_show DESC;