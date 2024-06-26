{{ config(materialized="incremental") }}

WITH clima_forecast AS (
    SELECT
        {{ date_trunc("day", "DATA") }} AS DIA,
        LOCAL,
        MIN(TEMPERATURA_MINIMA) AS TEMPERATURA_MINIMA,
        MAX(TEMPERATURA_MAXIMA) AS TEMPERATURA_MAXIMA,
        ROW_NUMBER() OVER (PARTITION BY {{ date_trunc("day", "DATA") }}, LOCAL ORDER BY LOCAL) AS row_num
    FROM {{ ref("dim_clima_forecast") }}
    GROUP BY {{ date_trunc("day", "DATA") }}, LOCAL
)


SELECT
    DIA,
    LOCAL,
    TEMPERATURA_MINIMA,
    TEMPERATURA_MAXIMA
FROM clima_forecast
WHERE row_num = 1
