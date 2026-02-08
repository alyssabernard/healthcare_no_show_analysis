SELECT 
  p.department,
  COUNT(*) AS total_appointments,
  COUNTIF(a.status = 'No-Show') AS no_show,
  SAFE_DIVIDE(COUNTIF(a.status= 'No-Show'), COUNT(*)) AS no_show_rate
FROM `cloudysanfrancisco-480317.healthcare.appointments` a
JOIN `cloudysanfrancisco-480317.healthcare.providers` p
ON a.provider_id = p.provider_id
GROUP BY p.department
ORDER BY no_show_rate DESC;

--Used this code to figure out the rate of no shows by department.
