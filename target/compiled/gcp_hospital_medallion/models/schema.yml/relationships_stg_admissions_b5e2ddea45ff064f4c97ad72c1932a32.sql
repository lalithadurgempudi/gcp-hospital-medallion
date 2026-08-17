
    
    

with child as (
    select encounter_id as from_field
    from `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_admissions`
    where encounter_id is not null
),

parent as (
    select encounter_id as to_field
    from `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_encounters`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


