# Useful Commands

Project: gcp-hospital-medallion
GCP Project: project-5fbc8bf7-2dd6-4f0a-a5f
Region: asia-south1
GCS Bucket: gcp-hospital-medallion-data

## 1. Project

```bash
cd ~/Documents/gcp/gcp-hospital-medallion
pwd
ls -la
git status
````

## 2. Python

Check Python:

```bash
python3 --version
python --version
which python3
```

Create virtual environment:

```bash
python3 -m venv .venv
```

Activate:

```bash
source .venv/bin/activate
```

Verify:

```bash
which python
python --version
```

Deactivate:

```bash
deactivate
```

Upgrade pip:

```bash
python -m pip install --upgrade pip
```

Check installed package:

```bash
pip show <package>
```

## 3. Google Cloud CLI

Check installation:

```bash
gcloud --version
```

Login:

```bash
gcloud auth login
```

Check authentication:

```bash
gcloud auth list
```

Set project:

```bash
gcloud config set project project-5fbc8bf7-2dd6-4f0a-a5f
```

Check active project:

```bash
gcloud config get-value project
```

Set region:

```bash
gcloud config set compute/region asia-south1
```

Check region:

```bash
gcloud config get-value compute/region
```

View configuration:

```bash
gcloud config list
```

## 4. GCP APIs

Enable BigQuery:

```bash
gcloud services enable bigquery.googleapis.com
```

List enabled APIs:

```bash
gcloud services list --enabled
```

Check BigQuery API:

```bash
gcloud services list --enabled | grep bigquery
```

## 5. Google Cloud Storage

List buckets:

```bash
gcloud storage buckets list
```

Create bucket:

```bash
gcloud storage buckets create \
gs://gcp-hospital-medallion-data \
--location=asia-south1
```

List bucket contents:

```bash
gcloud storage ls gs://gcp-hospital-medallion-data/
```

## 6. BigQuery CLI

Check BigQuery CLI:

```bash
bq version
```

List datasets:

```bash
bq ls
```

List tables:

```bash
bq ls hospital_bronze
bq ls hospital_silver
bq ls hospital_gold
```

Create datasets:

```bash
bq mk --dataset \
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_bronze

bq mk --dataset \
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_silver

bq mk --dataset \
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_gold
```

## 7. BigQuery Schema

Show table schema:

```bash
bq show --schema --format=prettyjson \
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_bronze.registrations
```

## 8. BigQuery Queries

Basic query:

```bash
bq query --use_legacy_sql=false '
SELECT *
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_bronze.registrations`
LIMIT 10
'
```

Count rows:

```bash
bq query --use_legacy_sql=false '
SELECT COUNT(*) AS row_count
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_bronze.registrations`
'
```

Count + watermark:

```bash
bq query --use_legacy_sql=false '
SELECT
    COUNT(*) AS row_count,
    MAX(updated_at) AS max_updated_at
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_silver.stg_registrations`
'
```

Distinct values:

```bash
bq query --use_legacy_sql=false '
SELECT DISTINCT status
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_bronze.registrations`
ORDER BY status
'
```

## 9. Install dbt

Activate the virtual environment first:

```bash
source .venv/bin/activate
```

Install dbt Core:

```bash
pip install dbt-core
```

Install BigQuery adapter:

```bash
pip install dbt-bigquery
```

Check dbt:

```bash
dbt --version
```

Check dbt location:

```bash
which dbt
```

Check packages:

```bash
pip show dbt-core
pip show dbt-bigquery
```

### Important

`dbt-core` = dbt framework

`dbt-bigquery` = BigQuery adapter

dbt runs locally on the Mac. It connects to BigQuery through the BigQuery adapter and configured GCP credentials.

## 10. dbt Project

Initialize:

```bash
dbt init gcp_hospital_medallion
```

Important files/directories:

```text
dbt_project.yml
~/.dbt/profiles.yml

models/
seeds/
snapshots/
tests/
macros/
analyses/
```

`dbt_project.yml` = project configuration

`profiles.yml` = connection configuration

## 11. dbt Connection & Validation

Check connection:

```bash
dbt debug
```

Parse project:

```bash
dbt parse
```

Compile SQL:

```bash
dbt compile
```

List dbt resources:

```bash
dbt ls
```

List models:

```bash
dbt ls --resource-type model
```

List sources:

```bash
dbt ls --resource-type source
```

List tests:

```bash
dbt ls --resource-type test
```

## 12. dbt Sources

Example source reference:

```sql
{{ source('hospital_bronze', 'registrations') }}
```

List sources:

```bash
dbt ls --resource-type source
```

## 13. dbt Models

Run all models:

```bash
dbt run
```

Run one model:

```bash
dbt run --select stg_registrations
```

Run multiple models:

```bash
dbt run --select stg_registrations stg_encounters
```

## 14. dbt Seeds

Run all seeds:

```bash
dbt seed
```

Run one seed:

```bash
dbt seed --select <seed_name>
```

## 15. dbt Snapshots

Run snapshots:

```bash
dbt snapshot
```

Check snapshot:

```bash
bq query --use_legacy_sql=false '
SELECT *
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_silver.doctors_snapshot`
ORDER BY doctor_id, dbt_valid_from
'
```

## 16. Incremental Models

Example:

```sql
{{ config(
    materialized='incremental',
    unique_key='registration_id'
) }}
```

Run incremental model:

```bash
dbt run --select stg_registrations
```

Full refresh:

```bash
dbt run --select stg_registrations --full-refresh
```

Check row count + watermark:

```bash
bq query --use_legacy_sql=false '
SELECT
    COUNT(*) AS row_count,
    MAX(updated_at) AS max_updated_at
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_silver.stg_registrations`
'
```

## 17. dbt Tests

Run all tests:

```bash
dbt test
```

Test one model:

```bash
dbt test --select stg_registrations
```

Run a specific test:

```bash
dbt test --select test_name:updated_at_not_before_created_at
```

Test definitions:

```text
models/schema.yml
```

Built-in generic tests used in this project:

```text
not_null
unique
relationships
accepted_values
```

## 18. Singular SQL Tests

Test location:

```text
tests/
```

Example:

```text
tests/discharge_after_admission.sql
```

Run:

```bash
dbt test --select discharge_after_admission
```

## 19. Custom Generic Tests

Location:

```text
tests/generic/
```

Example:

```text
tests/generic/updated_at_not_before_created_at.sql
```

Run:

```bash
dbt test --select test_name:updated_at_not_before_created_at
```

## 20. Test Severity

Warning:

```yaml
config:
  severity: warn
```

Error:

```yaml
config:
  severity: error
```

Threshold example:

```yaml
config:
  severity: error
  warn_if: "> 0"
  error_if: ">= 2"
```

Behavior:

```text
0 failures  -> PASS
1 failure   -> WARN
2+ failures -> ERROR
```

## 21. dbt Build

Run models + tests according to the DAG:

```bash
dbt build
```

Build one model:

```bash
dbt build --select stg_registrations
```

Build model + downstream:

```bash
dbt build --select stg_registrations+
```

## 22. Materializations

Common materializations:

```text
view
table
incremental
ephemeral
```

Correct:

```yaml
+materialized: table
```

Incorrect:

```yaml
+materialized: tables
```

## 23. Debugging

Search materialization configuration:

```bash
grep -R "materialized" dbt_project.yml models
```

Search for a value:

```bash
grep -R "tables" dbt_project.yml models macros
```

Inspect a model:

```bash
cat models/gold/billing_summary.sql
```

First lines:

```bash
head -20 models/gold/billing_summary.sql
```

## 24. dbt Target Directory

Compiled SQL:

```text
target/compiled/
```

Executed SQL:

```text
target/run/
```

Clean generated files:

```bash
dbt clean
```

## 25. Quick Daily Reference

```bash
# Activate environment
source .venv/bin/activate

# GCP
gcloud config get-value project
gcloud auth list

# BigQuery
bq ls
bq query --use_legacy_sql=false 'SQL'

# dbt validation
dbt debug
dbt parse

# dbt discovery
dbt ls

# Development
dbt compile
dbt run
dbt test

# Full dbt workflow
dbt build
```

## 26. Current Project Structure

```text
GCS
 |
 v
BigQuery Bronze
 |
 v
dbt Sources
 |
 v
Silver
 |
 +-- stg_registrations
 +-- stg_encounters
 +-- stg_admissions
 +-- stg_discharges
 +-- stg_billing
 +-- stg_doctors
 +-- stg_departments
 |
 v
Gold
 |
 +-- patient_360
 +-- encounter_summary
 +-- billing_summary
 |
 v
dbt Tests / DQ
 |
 v
dbt build
```

## 27. dbt Learning Progress

[✓] Python / virtual environment
[✓] GCP CLI
[✓] GCP authentication
[✓] GCP project configuration
[✓] GCP APIs
[✓] GCS
[✓] BigQuery
[✓] dbt Core
[✓] dbt BigQuery adapter
[✓] profiles.yml
[✓] dbt sources
[✓] dbt models
[✓] Materializations
[✓] Seeds
[✓] Snapshots
[✓] Incremental models
[✓] Generic tests
[✓] Singular tests
[✓] Custom generic tests
[✓] Test severity
[✓] warn_if / error_if
[✓] dbt build
[✓] DQ failure / downstream SKIP

[NEXT] dbt model selection

