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
character_events AS (
    SELECT * FROM {{ ref('agg_character_eve') }}
),
final AS (
    SELECT 
        c.character_name,
        o.occupation_name,
        ce.first_event_date,
        ce.last_event_date,
        coalesce(ce.number_of_events, 0) as number_of_events
    FROM characters AS c
        LEFT JOIN character_events AS ce
        USING (character_id)
        LEFT JOIN occupations AS o USING (occupation_id)
)
SELECT * 
FROM final