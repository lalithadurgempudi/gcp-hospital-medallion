
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT
    d.discharge_id,
    d.admission_id,
    d.discharge_date,
    a.admission_date
FROM `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_discharges` AS d
JOIN `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_admissions` AS a
    ON d.admission_id = a.admission_id
WHERE d.discharge_date < a.admission_date
  
  
      
    ) dbt_internal_test