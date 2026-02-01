SELECT county_state_name,
       population,
       CAST(
        REPLACE(`GHG emissions mtons CO2e`, ',' , '')
        AS DOUBLE
        ) / NULLIF(
          CAST(
            REPLACE(population, ',', '') 
            AS DOUBLE
          ),0
        ) AS Emission_per_person 
FROM emissions_data
ORDER BY emission_per_person DESC
LIMIT 10
