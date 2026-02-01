SELECT county_state_name,
       population,
       CAST(
        REPLACE(`GHG emissions mtons CO2e`, ',' , '')
        AS DOUBLE) AS Total_Emissions
FROM emissions_data
ORDER BY Total_Emissions DESC
LIMIT 10
