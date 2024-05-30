{{ config(materialized="view") }}
with
    source as (
        select temp, temp_min, temp_max, humidity, descricao, date_forecast, local
        from {{ source("sources", "CLIMA_FORECAST") }}
    )

select temp, temp_min, temp_max, humidity, descricao, date_forecast, local
from source
