{{ config(materialized='table') }}
SELECT
    temp AS temperatura_atual,
    temp_min as _temperatura_minima,
    temp_max AS temperatura_maxima,
    feels_like AS sensacao_termica,
    humidity AS umidade,
    DATE_INSERTION AS DATA,
    LOCAL
FROM {{ ref('stg_clima') }}
