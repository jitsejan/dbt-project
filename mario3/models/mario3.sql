{{ config(materialized='table') }}

WITH characters AS (
    SELECT
        id AS char_id,
        name AS char_name,
        description AS char_descr,
        colors,
        occupation_id,
        image
    from
        mario3.character_fact
),
worlds AS (
    SELECT
        id AS world_id,
        name AS world_name,
        description AS world_descr,
        world
    FROM
        mario3.world_fact
),
occupations AS (
    SELECT
        id AS occ_id,
        name AS occ_name
    FROM
        mario3.occupation_fact
),
events AS (
    SELECT
        id AS event_id,
        character_id,
        world_id,
        level,
        lives,
        time
    FROM 
        mario3.event_dim
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