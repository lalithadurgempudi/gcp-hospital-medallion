
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_registrations`
    group by status

)

select *
from all_values
where value_field not in (
    'Active','Inactive'
)



  
  
      
    ) dbt_internal_test