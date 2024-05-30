{{ config(materialized="view") }}
with
    source as (
        select TEMP, feels_like, temp_min, temp_max, humidity, date_insertion, local
        from {{ source("sources", "CLIMA") }}
    )

select TEMP, feels_like, temp_min, temp_max, humidity, date_insertion, local
from source
