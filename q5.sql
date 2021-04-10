/*QUERY #5: HOW MANY VISITS ARE THERE PER USER?*/
SELECT
  fullVisitorId,
  COUNT(visitNumber) as total_visits_per_user
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  visitNumber IS NOT NULL
GROUP BY
  fullVisitorId
ORDER BY
  total_visits_per_user DESC
