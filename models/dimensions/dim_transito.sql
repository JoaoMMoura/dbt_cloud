{{ config(materialized='table') }}
SELECT
    origem,
    destino,
    distancia,
    duracao,
    DATE_INSERTION
FROM {{ ref('stg_transito') }}
