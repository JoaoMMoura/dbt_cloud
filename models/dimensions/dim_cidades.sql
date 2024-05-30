{{ config(materialized='table') }}
SELECT
    cidade,
    estado,
    pais
FROM {{ ref('stg_dcidades') }}
