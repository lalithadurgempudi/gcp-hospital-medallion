
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

SELECT *
FROM `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_encounters`
WHERE updated_at < created_at


  
  
      
    ) dbt_internal_test