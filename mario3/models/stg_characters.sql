SELECT
    id AS character_id,
    name AS character_name,
    description AS character_description,
    colors,
    occupation_id,
    image
FROM
    {{ source('mario3', 'character_fact') }}