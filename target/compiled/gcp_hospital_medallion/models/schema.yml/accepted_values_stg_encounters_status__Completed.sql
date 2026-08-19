
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_encounters`
    group by status

)

select *
from all_values
where value_field not in (
    'Completed'
)


