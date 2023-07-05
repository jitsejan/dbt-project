SELECT
    id AS occupation_id,
    name AS occupation_name
FROM
    {{ source('mario3', 'occupation_fact') }}