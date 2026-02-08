SELECT 
  patient_id,
  COUNT(*) AS no_show_status
FROM `cloudysanfrancisco-480317.healthcare.appointments`
WHERE status = 'No-Show'
GROUP BY patient_id
HAVING COUNT(*) >= 2
ORDER BY no_show_status DESC;
--In this query I wanted to look deeper and see which patients had more than 2 no-shows and how many they had. To do this, I selected the patient id's and counted all and created a new column called "no_show_status". In order to only see the "no shows", I added in my WHERE clause to only count the no-show appointments. Then, I grouped by the patient ID so all the no-shows would should up under one row per patient. Then, since I was interested in just patients who had more than 2 no-shows, I used COUNT(*) to calculate the total number of no-shows per patient and applied a HAVING clause to keep only patients with two or more missed appointments. Finally, I ordered the results in descending order so patients with the highest number of no-shows appear at the top.
