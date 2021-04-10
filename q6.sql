/*QUERY #6: PERCENTAGE OFVISITS PER OPERATING SYSTEM*/
SELECT
  device.operatingSystem AS OS,
  COUNT(*) AS visits_per_OS,
  (COUNT(*) / SUM(COUNT(*)) OVER ())*100 AS Percentage
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY
  OS
ORDER BY
  Percentage DESC
