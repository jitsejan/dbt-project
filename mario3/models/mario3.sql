{{ config(materialized='table') }}

WITH characters AS (
    SELECT * FROM {{ ref('stg_characters') }}
),
worlds AS (
    SELECT * FROM {{ ref('stg_worlds') }}
),
occupations AS (
    SELECT * FROM {{ ref('stg_occupations') }}
),
events AS (
    SELECT * FROM {{ ref('stg_events') }}
),
final AS (
    SELECT 
        event_id,
        char_name,
        char_descr,
        occ_name,
        world_name,
        level,
        lives,
        time
    FROM events AS e
        LEFT JOIN characters AS c ON c.char_id = e.character_id
        LEFT JOIN occupations AS o ON o.occ_id = c.occupation_id
        LEFT JOIN worlds AS w on w.world_id = e.world_id
)
SELECT * 
FROM final