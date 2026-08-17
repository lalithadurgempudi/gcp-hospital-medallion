
  
    

    create or replace table `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_gold`.`patient_360`
      
    
    

    
    OPTIONS()
    as (
      WITH registration AS (

    SELECT
        registration_id,
        first_name,
        last_name,
        date_of_birth,
        gender,
        city,
        registration_date,
        status AS registration_status
    FROM `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_registrations`

),

encounter AS (

    SELECT
        registration_id,
        COUNT(DISTINCT encounter_id) AS encounter_count
    FROM `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_encounters`
    GROUP BY registration_id

),

admission AS (

    SELECT
        registration_id,
        COUNT(DISTINCT admission_id) AS admission_count
    FROM `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_admissions`
    GROUP BY registration_id

),

discharge AS (

    SELECT
        registration_id,
        COUNT(DISTINCT discharge_id) AS discharge_count
    FROM `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_discharges`
    GROUP BY registration_id

),

billing AS (

    SELECT
        registration_id,
        COUNT(DISTINCT bill_id) AS bill_count,
        SUM(total_amount) AS total_billed
    FROM `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_billing`
    GROUP BY registration_id

)

SELECT
    r.registration_id,
    r.first_name,
    r.last_name,
    r.date_of_birth,
    r.gender,
    r.city,
    r.registration_date,
    r.registration_status,

    COALESCE(e.encounter_count, 0) AS encounter_count,
    COALESCE(a.admission_count, 0) AS admission_count,
    COALESCE(d.discharge_count, 0) AS discharge_count,
    COALESCE(b.bill_count, 0) AS bill_count,
    COALESCE(b.total_billed, 0) AS total_billed

FROM registration AS r

LEFT JOIN encounter AS e
    ON r.registration_id = e.registration_id

LEFT JOIN admission AS a
    ON r.registration_id = a.registration_id

LEFT JOIN discharge AS d
    ON r.registration_id = d.registration_id

LEFT JOIN billing AS b
    ON r.registration_id = b.registration_id
    );
  