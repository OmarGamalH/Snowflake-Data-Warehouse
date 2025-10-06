{{
    config(materialized='ephemeral')
}}

WITH CTE_Customers AS 
(
    SELECT * FROM {{ref("Customers")}}
)
SELECT 
    CUSTOMERID,
    COMPANYNAME,
    CONTACTNAME,
    CONTACTTITLE,
    ADDRESS,
    CITY,
    REGION,
    CASE 
        WHEN LEN(POSTALCODE) = 0 THEN NULL
        ELSE POSTALCODE
    END AS POSTALCODE,
    COUNTRY,
    REPLACE(REGEXP_REPLACE(PHONE , '-|\\(|\\)|\\.' , '')  , ' ' , '') AS PHONE ,
    REPLACE(REGEXP_REPLACE(FAX , '-|\\(|\\)|\\.' , '')  , ' ' , '') AS FAX

FROM CTE_Customers
