SELECT
  appointment_time,
  COUNT(*) AS total_appointments,
  COUNTIF(a.status = 'No-Show') AS no_show,
  SAFE_DIVIDE(COUNTIF(status = 'No-Show'), COUNT(appointment_time)) AS rate_of_no_show
FROM `cloudysanfrancisco-480317.healthcare.appointments` a
  GROUP BY appointment_time
  ORDER BY rate_of_no_show DESC;

  --Next I wanted to analyze if there was a particular appointment time that tended to have more no-shows. To figure this out, I selected my appointment time, created a new column named "total appointments" by using the COUNT function to count all of the appointments. Then I had to filter out the no-shows, so I used the COUNTIF function to only count the no-shows. Although I am using only one table in this particular querey, I still decided to qualify my column using a table alias to avoid ambiguity, especially since I have been joinging tables, and to make my queries more readable and maintainable. Then to find the rate, I used the SAFE_DIVIDE function to divide the no show appointments by the total appointments. 
