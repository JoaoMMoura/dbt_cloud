{{ config(materialized="view") }}
with
    source as (
        select cidade, estado, pais
        from {{ source("sources", "dcidades") }}
    )

select cidade, estado, pais
from source