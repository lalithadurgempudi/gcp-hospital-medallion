# Useful Commands - GCP Hospital Medallion

Project: gcp-hospital-medallion
GCP Project: project-5fbc8bf7-2dd6-4f0a-a5f
GCP Region: asia-south1
GCS Bucket: gcp-hospital-medallion-data

============================================================
1. PROJECT / TERMINAL
============================================================

# Go to project
cd ~/Documents/gcp/gcp-hospital-medallion

# Current directory
pwd

# List files
ls
ls -la

# Git status
git status


============================================================
2. PYTHON
============================================================

# Check Python
python3 --version
python --version

# Find Python
which python3
which python

# Create virtual environment
python3 -m venv .venv

# Activate virtual environment
source .venv/bin/activate

# Verify active Python
which python
python --version

# Deactivate
deactivate

# Upgrade pip
python -m pip install --upgrade pip

# Install Python package
pip install <package>

# Check installed package
pip show <package>


============================================================
3. GOOGLE CLOUD CLI
============================================================

# Check gcloud
gcloud --version

# Login
gcloud auth login

# Check authenticated accounts
gcloud auth list

# Set GCP project
gcloud config set project project-5fbc8bf7-2dd6-4f0a-a5f

# Check active project
gcloud config get-value project

# Set region
gcloud config set compute/region asia-south1

# Check region
gcloud config get-value compute/region

# View complete gcloud configuration
gcloud config list


============================================================
4. GCP APIs
============================================================

# Enable BigQuery API
gcloud services enable bigquery.googleapis.com

# List enabled APIs
gcloud services list --enabled

# Check BigQuery API
gcloud services list --enabled | grep bigquery


============================================================
5. GOOGLE CLOUD STORAGE
============================================================

# List buckets
gcloud storage buckets list

# Create bucket
gcloud storage buckets create \
gs://gcp-hospital-medallion-data \
--location=asia-south1

# List GCS objects
gcloud storage ls

# List objects inside bucket
gcloud storage ls gs://gcp-hospital-medallion-data/


============================================================
6. BIGQUERY CLI
============================================================

# Check bq
bq version

# List datasets
bq ls

# List tables in dataset
bq ls hospital_bronze
bq ls hospital_silver
bq ls hospital_gold

# Create dataset
bq mk --dataset \
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_bronze

bq mk --dataset \
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_silver

bq mk --dataset \
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_gold


============================================================
7. BIGQUERY SCHEMA
============================================================

# Show table schema
bq show --schema --format=prettyjson \
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_bronze.registrations

# Example
bq show --schema --format=prettyjson \
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_bronze.encounters


============================================================
8. BIGQUERY QUERIES
============================================================

# Basic query
bq query --use_legacy_sql=false '
SELECT *
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_bronze.registrations`
LIMIT 10
'

# Count rows
bq query --use_legacy_sql=false '
SELECT COUNT(*) AS row_count
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_bronze.registrations`
'

# Count + watermark
bq query --use_legacy_sql=false '
SELECT
    COUNT(*) AS row_count,
    MAX(updated_at) AS max_updated_at
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_silver.stg_registrations`
'

# Distinct values
bq query --use_legacy_sql=false '
SELECT DISTINCT status
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_bronze.registrations`
ORDER BY status
'


============================================================
9. DBT INSTALLATION
============================================================

# Install dbt core
pip install dbt-core

# Install BigQuery adapter
pip install dbt-bigquery

# Check dbt
dbt --version

# Check dbt location
which dbt

# Check dbt-core
pip show dbt-core

# Check BigQuery adapter
pip show dbt-bigquery


============================================================
10. DBT PROJECT INITIALIZATION
============================================================

# Initialize dbt project
dbt init gcp_hospital_medallion

# Main project configuration
dbt_project.yml

# dbt connection configuration
~/.dbt/profiles.yml


============================================================
11. DBT CONNECTION / VALIDATION
============================================================

# Validate dbt + BigQuery configuration
dbt debug

# Parse project
dbt parse

# Compile project
dbt compile

# List dbt resources
dbt ls

# List models
dbt ls --resource-type model

# List sources
dbt ls --resource-type source

# List tests
dbt ls --resource-type test


============================================================
12. DBT SOURCES
============================================================

# List sources
dbt ls --resource-type source

# Source reference inside model
{{ source('hospital_bronze', 'registrations') }}


============================================================
13. DBT MODELS
============================================================

# Run all models
dbt run

# Run one model
dbt run --select stg_registrations

# Run multiple models
dbt run --select stg_registrations stg_encounters

# Full refresh incremental model
dbt run --select stg_registrations --full-refresh


============================================================
14. DBT SEEDS
============================================================

# Load all seeds
dbt seed

# Load specific seed
dbt seed --select <seed_name>


============================================================
15. DBT SNAPSHOTS
============================================================

# Run snapshots
dbt snapshot

# Query snapshot
bq query --use_legacy_sql=false '
SELECT *
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_silver.doctors_snapshot`
ORDER BY doctor_id, dbt_valid_from
'


============================================================
16. DBT INCREMENTAL MODELS
============================================================

# Example configuration

{{ config(
    materialized='incremental',
    unique_key='registration_id'
) }}

# Run incremental model
dbt run --select stg_registrations

# Rebuild incremental model completely
dbt run --select stg_registrations --full-refresh

# Check row count and watermark
bq query --use_legacy_sql=false '
SELECT
    COUNT(*) AS row_count,
    MAX(updated_at) AS max_updated_at
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_silver.stg_registrations`
'


============================================================
17. DBT TESTING
============================================================

# Run all tests
dbt test

# Test one model
dbt test --select stg_registrations

# Run specific test
dbt test --select test_name:updated_at_not_before_created_at

# Test definitions
models/schema.yml

# Common built-in tests
not_null
unique
relationships
accepted_values


============================================================
18. SINGULAR SQL TESTS
============================================================

# Location
tests/

# Example
tests/discharge_after_admission.sql

# Run specific test
dbt test --select discharge_after_admission


============================================================
19. CUSTOM GENERIC TESTS
============================================================

# Location
tests/generic/

# Example
tests/generic/updated_at_not_before_created_at.sql

# Run custom generic test
dbt test --select test_name:updated_at_not_before_created_at


============================================================
20. TEST SEVERITY
============================================================

# Warning
config:
  severity: warn

# Error
config:
  severity: error

# Threshold example
config:
  severity: error
  warn_if: "> 0"
  error_if: ">= 2"

# Example behavior
0 failures  -> PASS
1 failure   -> WARN
2+ failures -> ERROR


============================================================
21. DBT BUILD
============================================================

# Run models + tests according to DAG
dbt build

# Build specific model
dbt build --select stg_registrations

# Build model and downstream dependencies
dbt build --select stg_registrations+


============================================================
22. DBT MATERIALIZATIONS
============================================================

# Common materializations

materialized='view'

materialized='table'

materialized='incremental'

materialized='ephemeral'

# IMPORTANT
# Correct:
+materialized: table

# Incorrect:
+materialized: tables


============================================================
23. DBT CONFIGURATION / DEBUGGING
============================================================

# Search materialization configuration
grep -R "materialized" dbt_project.yml models

# Search for a specific value
grep -R "tables" dbt_project.yml models macros

# Inspect model
cat models/gold/billing_summary.sql

# First lines of model
head -20 models/gold/billing_summary.sql


============================================================
24. DBT TARGET DIRECTORY
============================================================

# Compiled SQL
target/compiled/

# Executed SQL
target/run/

# Clean generated dbt files
dbt clean


============================================================
25. USEFUL DBT COMMAND SUMMARY
============================================================

dbt --version
dbt debug
dbt parse
dbt ls
dbt compile

dbt seed
dbt snapshot

dbt run
dbt run --select <model>
dbt run --select <model> --full-refresh

dbt test
dbt test --select <model>
dbt test --select test_name:<test_name>

dbt build
dbt build --select <model>


============================================================
26. CURRENT PROJECT ARCHITECTURE
============================================================

GCS
 |
 v
Raw / Source Data
 |
 v
BigQuery Bronze
 |
 v
dbt Sources
 |
 v
dbt Silver Models
 |
 +--> stg_registrations
 +--> stg_encounters
 +--> stg_admissions
 +--> stg_discharges
 +--> stg_billing
 +--> stg_doctors
 +--> stg_departments
 |
 v
dbt Gold Models
 |
 +--> patient_360
 +--> encounter_summary
 +--> billing_summary
 |
 v
DQ / Tests
 |
 v
dbt build


============================================================
27. DBT LEARNING PROGRESS
============================================================

[✓] Project / Python environment
[✓] GCP CLI setup
[✓] GCP authentication
[✓] GCP project configuration
[✓] GCP APIs
[✓] GCS
[✓] BigQuery
[✓] dbt-core
[✓] dbt-bigquery adapter
[✓] dbt profiles.yml
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