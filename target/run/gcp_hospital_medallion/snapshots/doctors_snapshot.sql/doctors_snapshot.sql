
      merge into `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`doctors_snapshot` as DBT_INTERNAL_DEST
    using `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`doctors_snapshot__dbt_tmp203038062040` as DBT_INTERNAL_SOURCE
    on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id

    when matched
     
       and DBT_INTERNAL_DEST.dbt_valid_to is null
     
     and DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete')
        then update
        set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to

    when not matched
     and DBT_INTERNAL_SOURCE.dbt_change_type = 'insert'
        then insert (`doctor_id`, `doctor_name`, `specialization_id`, `specialization_name`, `status`, `joining_date`, `created_at`, `updated_at`, `dbt_updated_at`, `dbt_valid_from`, `dbt_valid_to`, `dbt_scd_id`)
        values (`doctor_id`, `doctor_name`, `specialization_id`, `specialization_name`, `status`, `joining_date`, `created_at`, `updated_at`, `dbt_updated_at`, `dbt_valid_from`, `dbt_valid_to`, `dbt_scd_id`)


  