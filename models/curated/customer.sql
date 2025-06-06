

{{ config(
    materialized="incremental",
    unique_key= "CUSTOMER_ID",
    pre_hook= "{{ create_stream('strm_customer',ref(\'customer_lnd\')) }}"
) }}




with curated as (

    select * from 

    {% if is_incremental()== true %}

    {{target.database}}.{{target.schema}}.strm_customer

    {% else %}

    {{ref('customer_lnd')}}

    {% endif %}


)

select * from curated