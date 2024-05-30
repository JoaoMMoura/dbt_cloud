{{ config(materialized='table') }}
SELECT
    temp AS temperatura_atual,
    temp_min as temperatura_minima,
    temp_max AS temperatura_maxima,
    descricao,
    humidity AS umidade,
    date_forecast AS DATA,
    LOCAL
FROM {{ ref('stg_clima_forecast') }}
