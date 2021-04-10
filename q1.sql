/*QUERY#1:ALL THE TRANSACTIONSBY VISITORS IN JULY 2017*/
SELECT
  h.TRANSACTION.transactionid,
  fullvisitorid,
  TIMESTAMP_SECONDS(visitstarttime) as visit_time,
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS h
WHERE
  _TABLE_SUFFIX BETWEEN '20170701'
  AND '20170731'
  AND h.TRANSACTION.transactionid IS NOT NULL
GROUP BY
  h.TRANSACTION.transactionid,
  fullvisitorid,
  visit_time,
  date
ORDER BY visit_time ASC