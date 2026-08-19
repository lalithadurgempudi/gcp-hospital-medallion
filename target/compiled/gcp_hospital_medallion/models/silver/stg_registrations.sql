

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
FROM `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_bronze`.`registrations`



WHERE updated_at >= TIMESTAMP_SUB(
    (
        SELECT MAX(updated_at)
        FROM `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_registrations`
    ),
    INTERVAL 1 HOUR
)

