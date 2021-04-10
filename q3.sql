/*QUERY #3: HOW MANY CLICKS ARETHERE PER LANDING PAGE?*/
SELECT
  hits.page.pagePath AS LandingPage,
  COUNT(totals.hits) AS Clicks
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS hits
WHERE
  hits.type="PAGE"
  AND hits.hitNumber IS NOT NULL
GROUP BY
  LandingPage
ORDER BY
  Clicks DESC
