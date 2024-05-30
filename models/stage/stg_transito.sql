{{ config(materialized="view") }}
with
    source as (
        select origem, destino, distancia, duracao, DATE_INSERTION
        from {{ source("sources", "TRANSITO") }}
    )

select origem, destino, distancia, duracao, DATE_INSERTION
from source
