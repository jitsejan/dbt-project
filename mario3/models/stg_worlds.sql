SELECT
    id AS world_id,
    name AS world_name,
    description AS world_descr,
    world
FROM
    {{ source('mario3', 'world_fact') }}