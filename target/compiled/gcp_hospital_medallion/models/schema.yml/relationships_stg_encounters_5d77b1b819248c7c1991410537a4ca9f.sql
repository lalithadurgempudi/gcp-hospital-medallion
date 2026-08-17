
    
    

with child as (
    select registration_id as from_field
    from `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_encounters`
    where registration_id is not null
),

parent as (
    select registration_id as to_field
    from `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_registrations`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


