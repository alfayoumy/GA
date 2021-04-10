/*QUERY#2: FREQUENCY OF EACH CONTENT GROUP PER COUNTRY*/
CREATE TEMP FUNCTION
  GetNamesAndCounts(elements ARRAY<STRING>) AS ( ARRAY(
    SELECT
      AS STRUCT elem AS name,
      COUNT(*) AS freq
    FROM
      UNNEST(elements) AS elem
    GROUP BY
      elem
    ORDER BY
      freq DESC ) );
SELECT
  geoNetwork.country AS country,
  GetNamesAndCounts(ARRAY_AGG(h.contentGroup.contentGroup2)) AS Category
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST(hits) AS h
WHERE
  geoNetwork.country != '(not set)'
  AND h.contentGroup.contentGroup2 != '(not set)'
GROUP BY
  country
ORDER BY
  country ASC
