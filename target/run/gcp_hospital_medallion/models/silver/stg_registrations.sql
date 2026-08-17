
  
    

    create or replace table `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_registrations`
      
    
    

    
    OPTIONS()
    as (
      

SELECT *
FROM `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_bronze`.`registrations`


    );
  