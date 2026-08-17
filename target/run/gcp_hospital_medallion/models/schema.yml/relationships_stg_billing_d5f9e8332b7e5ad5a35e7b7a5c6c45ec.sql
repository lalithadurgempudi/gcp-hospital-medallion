
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select discharge_id as from_field
    from `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_billing`
    where discharge_id is not null
),

parent as (
    select discharge_id as to_field
    from `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_discharges`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test