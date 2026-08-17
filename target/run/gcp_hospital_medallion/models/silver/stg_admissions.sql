

  create or replace view `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_silver`.`stg_admissions`
  OPTIONS()
  as SELECT * FROM `project-5fbc8bf7-2dd6-4f0a-a5f`.`hospital_bronze`.`admissions`;

