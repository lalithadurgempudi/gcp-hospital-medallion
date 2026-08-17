
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select registration_id
from `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_gold`.`patient_360`
where registration_id is null



  
  
      
    ) dbt_internal_test