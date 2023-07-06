SELECT
    id AS event_id,
    character_id,
    world_id,
    level,
    lives,
    time
FROM 
    {{ source('mario3', 'event_dim') }}