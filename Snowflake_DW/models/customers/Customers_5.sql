{{
    config(
        materialized='table',
        alias='DimCustomers'
        )
}}

WITH CTE_CUSTOMERS AS 
(
    SELECT
        CUSTOMER_ID,
        COMPANY_NAME,
        FIRST_NAME,
        LAST_NAME,
        ADDRESS,
        CITY,
        REGION,
        POSTAL_CODE,
        CASE
            WHEN COUNTRY = 'Uk' THEN 'United Kingdom'
            WHEN COUNTRY = 'Usa' THEN 'United States'
            ELSE COUNTRY
        END AS COUNTRY,
        PHONE,
        FAX
    FROM {{ref('Customers_4')}} 
)
SELECT * FROM CTE_CUSTOMERS