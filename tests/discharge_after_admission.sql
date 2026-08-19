SELECT
    d.discharge_id,
    d.admission_id,
    d.discharge_date,
    a.admission_date
FROM {{ ref('stg_discharges') }} AS d
JOIN {{ ref('stg_admissions') }} AS a
    ON d.admission_id = a.admission_id
WHERE d.discharge_date < a.admission_date