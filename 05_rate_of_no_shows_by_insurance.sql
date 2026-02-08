SELECT 
  insurance_type,
  COUNT(*) AS total_appointments,
  COUNTIF(a.status = 'No-Show') AS no_show,
  SAFE_DIVIDE(COUNTIF(a.status = 'No-Show'), COUNT(*)) AS rate_of_no_shows
FROM `cloudysanfrancisco-480317.healthcare.appointments` a
JOIN  `cloudysanfrancisco-480317.healthcare.patients` p
ON a.patient_id = p.patient_id
GROUP BY p.insurance_type
ORDER BY rate_of_no_shows DESC;

--I created this code to select the rate of no shows by department. I selected the insurance type, utilized the COUNT function to count all of the appointments, and then used the COUNTIF function to only count the appointments that had "No-Show". I then took the formula I wrote for No-Shows and divided it by the formula I wrote to total all of the appointments. Because all of this information wasn't available on one table, I joined my patients table to my appointments table to get all of the information needed. I then grouped by insurance insurance type and ordered it by highest rate of no shows to lowest rate of of no shows.