{{ config(
    materialized='incremental',
    unique_key='registration_id'
) }}

SELECT
    registration_id,
    first_name,
    last_name,
    date_of_birth,
    gender,
    city,
    registration_date,
    status,
    created_at
FROM {{ source('hospital_bronze', 'registrations') }}

{% if is_incremental() %}

WHERE updated_at >= TIMESTAMP_SUB(
    (
        SELECT MAX(updated_at)
        FROM {{ this }}
    ),
    INTERVAL 1 HOUR
)

{% endif %}