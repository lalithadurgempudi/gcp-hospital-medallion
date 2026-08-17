
  
    

    create or replace table `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_gold`.`encounter_summary`
      
    
    

    
    OPTIONS()
    as (
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

FROM `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_encounters` AS e

LEFT JOIN `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_doctors` AS d
    ON e.doctor_id = d.doctor_id

LEFT JOIN `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_departments` AS dept
    ON e.department_id = dept.department_id
    );
  