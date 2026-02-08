SELECT
  COUNT(*) AS total_appointments,
  COUNTIF(status = "No-Show"),
  SAFE_DIVIDE(
    COUNTIF(status = "No-Show"),COUNT(*)) AS no_show_rate

FROM `cloudysanfrancisco-480317.healthcare.appointments`

