
    
    

with all_values as (

    select
        encounter_type as value_field,
        count(*) as n_records

    from `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_encounters`
    group by encounter_type

)

select *
from all_values
where value_field not in (
    'Emergency','Follow-up','OPD'
)


