SELECT
    e.encounter_id,
    e.registration_id,
    e.encounter_date,
    e.encounter_type,
    e.status AS encounter_status,

    e.doctor_id,
    d.doctor_name,
    d.specialization_id,
    d.specialization_name,

    e.department_id,
    dept.department_name

FROM {{ ref('stg_encounters') }} AS e

LEFT JOIN {{ ref('stg_doctors') }} AS d
    ON e.doctor_id = d.doctor_id

LEFT JOIN {{ ref('stg_departments') }} AS dept
    ON e.department_id = dept.department_id