
WITH CTE_SHIP AS 
(
    SELECT 
        SHIP_NAME,
        SHIP_ADDRESS,
        SHIP_CITY,
        SHIP_REGION,
        SHIP_POSTALCODE,
        SHIP_COUNTRY
    FROM {{ref('Orders')}} 
)
SELECT * FROM CTE_SHIP