# dbt Testing

## Purpose

This directory contains the dbt model-level data quality tests for the hospital Medallion platform.

## Test coverage

### Key integrity

The following primary/business keys are tested for `not_null` and `unique`:

- registration_id
- encounter_id
- admission_id
- discharge_id
- bill_id
- doctor_id
- department_id

### Referential integrity

The following relationships are tested:

- encounters → registrations
- encounters → doctors
- encounters → departments
- admissions → registrations
- admissions → encounters
- admissions → doctors
- admissions → departments
- discharges → admissions
- discharges → registrations
- billing → registrations
- billing → encounters
- billing → admissions
- billing → discharges

### Gold-layer grain

The Gold models are tested at their intended grain:

- `patient_360`: one row per `registration_id`
- `encounter_summary`: one row per `encounter_id`
- `billing_summary`: one row per `registration_id`

## Run tests

From the project root:

```bash
dbt test
```

For a specific model:

```bash
dbt test --select stg_encounters
```

For all Silver models:

```bash
dbt test --select silver
```

For all Gold models:

```bash
dbt test --select gold
```

## Important

These are actual executable dbt tests. The test results should be recorded only after `dbt test` has been executed against the current BigQuery data.
