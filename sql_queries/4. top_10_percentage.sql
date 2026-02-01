WITH state_emissions AS (
  SELECT state_abbr,
         SUM(CAST(REPLACE(`GHG emissions mtons CO2e`, ',', '') AS DOUBLE)) AS total_emissions
  FROM emissions_data
  GROUP BY state_abbr
),

top10 AS (
  SELECT state_abbr, total_emissions
  FROM state_emissions
  ORDER BY total_emissions DESC
  LIMIT 10
),

totals AS (
  SELECT SUM(total_emissions) AS national_total
  FROM state_emissions
),

top10_sum AS (
  SELECT SUM(total_emissions) AS top10_total
  FROM top10
)

SELECT t.state_abbr,
       t.total_emissions,
       ROUND(100.0 * s.top10_total / tot.national_total, 2) AS top10_percentage_of_national
FROM top10 t
CROSS JOIN top10_sum s
CROSS JOIN totals tot
ORDER BY t.total_emissions DESC;
