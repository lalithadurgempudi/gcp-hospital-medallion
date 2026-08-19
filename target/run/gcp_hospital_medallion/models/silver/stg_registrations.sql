-- back compat for old kwarg name
  
  
        
            
            
            
            
        
    

    

    merge into `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_registrations` as DBT_INTERNAL_DEST
        using (
        select
        * from `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_registrations__dbt_tmp202747239768`
        ) as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.registration_id = DBT_INTERNAL_DEST.registration_id))

    
    when matched then update set
        `registration_id` = DBT_INTERNAL_SOURCE.`registration_id`,`first_name` = DBT_INTERNAL_SOURCE.`first_name`,`last_name` = DBT_INTERNAL_SOURCE.`last_name`,`date_of_birth` = DBT_INTERNAL_SOURCE.`date_of_birth`,`gender` = DBT_INTERNAL_SOURCE.`gender`,`city` = DBT_INTERNAL_SOURCE.`city`,`registration_date` = DBT_INTERNAL_SOURCE.`registration_date`,`status` = DBT_INTERNAL_SOURCE.`status`,`created_at` = DBT_INTERNAL_SOURCE.`created_at`,`updated_at` = DBT_INTERNAL_SOURCE.`updated_at`
    

    when not matched then insert
        (`registration_id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `city`, `registration_date`, `status`, `created_at`, `updated_at`)
    values
        (`registration_id`, `first_name`, `last_name`, `date_of_birth`, `gender`, `city`, `registration_date`, `status`, `created_at`, `updated_at`)


    