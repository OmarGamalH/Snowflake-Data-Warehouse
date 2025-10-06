{{
    config(
        materialized='ephemeral'
    )
}}

WITH CTE_CUSTOMERS AS 
(
    SELECT * FROM {{ref('Customers_3')}}
)
, CTE_CUSTOMERS_2 AS 
(
    SELECT 
        CUSTOMERID AS customer_id,
        COMPANYNAME AS company_name,
        CONTACTNAME AS contact_name,
        ADDRESS AS address,
        CITY AS city,
        REGION AS region,
        POSTALCODE AS postal_code,
        COUNTRY AS country,
        PHONE AS phone,
        FAX AS fax
    FROM CTE_CUSTOMERS
) , CTE_CUSTOMERS_3 AS
(
    SELECT 
        CUSTOMER_ID,
        COMPANY_NAME,
        CAST(SPLIT(CONTACT_NAME , ' ')[0] AS VARCHAR(255)) AS FIRST_NAME,
        CAST(SPLIT(CONTACT_NAME , ' ')[1] AS VARCHAR(255)) AS LAST_NAME,
        ADDRESS,
        CITY,
        REGION,
        POSTAL_CODE,
        COUNTRY,
        PHONE,
        FAX
    FROM CTE_CUSTOMERS_2
)
SELECT * FROM CTE_CUSTOMERS_3