/*QUERY #7: PERCENTAGE OFVISITS PER COUNTRY*/
SELECT
  geoNetwork.country AS country,
  COUNT(*) AS visits_per_OS,
  (COUNT(*) / SUM(COUNT(*)) OVER ())*100 AS Percentage
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY
  country
ORDER BY
  Percentage DESC
