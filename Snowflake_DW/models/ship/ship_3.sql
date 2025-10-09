
{{
    config(
        materialized='table',
        alias='DimShip'
    )
}}

WITH CTE_SHIP AS 
(
    SELECT * FROM {{ref('ship_2')}}

) , CTE_SHIP_2 AS
(
    SELECT
        SHIP_ID,
        SHIP_NAME,
        SHIP_ADDRESS,
        SHIP_CITY,
        SHIP_REGION,
        REGEXP_REPLACE(SHIP_POSTALCODE , '.+[^0-9]+.+'  , 'null') AS SHIP_POSTALCODE,
        SHIP_COUNTRY
    FROM CTE_SHIP 
), CTE_SHIP_3 AS 
(
    SELECT 
        SHIP_ID,
        SHIP_NAME,
        SHIP_ADDRESS,
        SHIP_CITY,
        SHIP_REGION,
        CASE
            WHEN SHIP_POSTALCODE = 'null' THEN NULL
            ELSE SHIP_POSTALCODE
        END AS SHIP_POSTALCODE,
        CASE 
            WHEN SHIP_COUNTRY = 'UK' THEN 'United Kingdom'
            WHEN SHIP_COUNTRY = 'USA' THEN 'United States'
            ELSE SHIP_COUNTRY
        END AS SHIP_COUNTRY
    FROM CTE_SHIP_2
)
SELECT * FROM CTE_SHIP_3