{{ config(materialized='table') }}

WITH characters AS (
    SELECT * FROM {{ ref('stg_characters') }}
),
events AS (
    SELECT * FROM {{ ref('stg_events') }}
),
final AS (
    SELECT
        character_id,
        min(time) AS first_event_date,
        max(time) AS last_event_date,
        count(event_id) AS number_of_events
    FROM
        characters
    RIGHT JOIN
        events
    USING
        (character_id)
    GROUP BY
        1

)
SELECT * 
FROM final