SELECT
    b.registration_id,
    COUNT(DISTINCT b.bill_id) AS bill_count,

    SUM(b.consultation_amount) AS consultation_amount,
    SUM(b.procedure_amount) AS procedure_amount,
    SUM(b.room_amount) AS room_amount,
    SUM(b.other_amount) AS other_amount,
    SUM(b.total_amount) AS total_billed

FROM {{ ref('stg_billing') }} AS b

GROUP BY
    b.registration_id