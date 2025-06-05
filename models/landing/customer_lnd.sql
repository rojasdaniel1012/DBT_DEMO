{#
Example of how to include comments or documentation in DBT by using Jinja comments
#}

{{ config(
    materialized="view"
) }}


with source as (
    select 
    ID as CUSTOMER_ID,
    Year_Birth,
    CASE 
        WHEN Education = 'Graduation' THEN 'Bachelor''s Degree'
        WHEN Education = 'PhD' THEN 'Doctorate'
        WHEN Education = 'Master' THEN 'Master''s Degree'
        WHEN Education = 'Basic' THEN 'Primary Education'
        WHEN Education = '2n Cycle' THEN 'Secondary Education'
        ELSE 'Other'
        END  AS EDUCATION_LEVEL,
    CASE 
        WHEN Marital_Status = 'Together' then 'Common-Law Union'
        WHEN Marital_Status in ('YOLO','Alone','Absurd') then 'Single'
        WHEN Marital_Status = 'Widow' then 'Widowed'
        ELSE  Marital_Status END,
    COALESCE(Income,0):: number(38,2) AS INCOME,
    Kidhome,
    Teenhome,
    Recency,
    MntWines,
    MntFruits,
    MntMeatProducts,
    MntFishProducts,
    MntSweetProducts,
    MntGoldProds,
    NumDealsPurchases,
    NumWebPurchases,
    NumCatalogPurchases,
    NumStorePurchases,
    NumWebVisitsMonth,
    AcceptedCmp3,
    AcceptedCmp4,
    AcceptedCmp5,
    AcceptedCmp1,
    AcceptedCmp2,
    Complain,
    Z_CostContact,
    Z_Revenue,
    Response,
    TO_DATE(Dt_Customer,'DD-MM-YYYY') AS DATE

    from 
    {{ source("flatfiles",'marketing_data') }}
)

select * from source