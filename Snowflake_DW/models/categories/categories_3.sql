
{{
    config(
        materialized='table',
        alias='DimCategories'
    )
}}


WITH CTE_CATEGORIES AS
(
    SELECT * FROM {{ref('categories_2')}}
)
SELECT 
    CATEGORY_ID,
    INITCAP(CATEGORY_NAME) AS CATEGORY_NAME,
    INITCAP(CATEGORY_DESCRIPTION) AS CATEGORY_DESCRIPTION
FROM CTE_CATEGORIES