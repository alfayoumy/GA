/*QUERY #4: HOW MANY SESSIONS ARE THERE PER MONTH? */
SELECT EXTRACT(MONTH FROM PARSE_DATE ("%Y%m%d", date)) as Month,
  SUM(totals.visits) AS sessions
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE
    _TABLE_SUFFIX BETWEEN '20160801'
    AND '20170731'
GROUP BY Month
ORDER BY sessions DESC
