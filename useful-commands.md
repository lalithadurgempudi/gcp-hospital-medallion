# Useful Commands

## Project Details

| Property | Value |
|---|---|
| **Project** | `gcp-hospital-medallion` |
| **GCP Project ID** | `project-5fbc8bf7-2dd6-4f0a-a5f` |
| **Region** | `asia-south1` |
| **GCS Bucket** | `gcp-hospital-medallion-data` |

---

## dbt debug

```text
(.venv) venkatramireddy@Venkatramis-MacBook-Pro gcp-hospital-medallion % dbt debug

10:31:36  Running with dbt=1.12.2
10:31:36  dbt version: 1.12.2
10:31:36  python version: 3.14.6
10:31:36  python path: /Users/venkatramireddy/Documents/gcp/gcp-hospital-medallion/.venv/bin/python
10:31:36  os info: macOS-26.5.2-arm64-arm-64bit-Mach-O
10:31:37  Using profiles dir at /Users/venkatramireddy/.dbt
10:31:37  Using profiles.yml file at /Users/venkatramireddy/.dbt/profiles.yml
10:31:37  Using dbt_project.yml file at /Users/venkatramireddy/Documents/gcp/gcp-hospital-medallion/dbt_project.yml
10:31:37  adapter type: bigquery
10:31:37  adapter version: 1.12.0

10:31:37  Configuration:
10:31:37    profiles.yml file [OK found and valid]
10:31:37    dbt_project.yml file [OK found and valid]

10:31:37  Required dependencies:
10:31:37   - git [OK found]

10:31:37  Connection:
10:31:37    method: oauth
10:31:37    database: project-5fbc8bf7-2dd6-4f0a-a5f
10:31:37    execution_project: project-5fbc8bf7-2dd6-4f0a-a5f
10:31:37    schema: hospital_silver
10:31:37    location: asia-south1
10:31:37    priority: interactive
10:31:37    maximum_bytes_billed: None
10:31:37    reservation: None
10:31:37    impersonate_service_account: None
10:31:37    job_retry_deadline_seconds: None
10:31:37    job_retries: 1
10:31:37    job_creation_timeout_seconds: None
10:31:37    job_execution_timeout_seconds: 300
10:31:37    job_link_info_level_log: False
10:31:37    timeout_seconds: 300
10:31:37    client_id: None
10:31:37    token_uri: None
10:31:37    compute_region: None
10:31:37    dataproc_cluster_name: None
10:31:37    gcs_bucket: None
10:31:37    dataproc_batch: None

10:31:37  Registered adapter: bigquery=1.12.0
10:31:39  Connection test: [OK connection ok]
```

### Result

**`dbt debug` passed successfully.**

* **dbt:** 1.12.2
* **Python:** 3.14.6
* **Adapter:** BigQuery 1.12.0
* **Project:** `project-5fbc8bf7-2dd6-4f0a-a5f`
* **Dataset:** `hospital_silver`
* **Region:** `asia-south1`
* **Authentication:** OAuth
* **Connection:** ✅ OK

### Connection Details

| Property                                           | Value                            |
| -------------------------------------------------- | -------------------------------- |
| **Connection Method**                              | `oauth`                          |
| **Database / Project**                             | `project-5fbc8bf7-2dd6-4f0a-a5f` |
| **Execution Project**                              | `project-5fbc8bf7-2dd6-4f0a-a5f` |
| **Schema / Dataset**                               | `hospital_silver`                |
| **Location**                                       | `asia-south1`                    |
| **Priority**                                       | `interactive`                    |
| **Adapter Type**                                   | `bigquery`                       |
| **Adapter Version**                                | `1.12.0`                         |
| **dbt Version**                                    | `1.12.2`                         |
| **Python Version**                                 | `3.14.6`                         |
| **Maximum Bytes Billed**                           | `None`                           |
| **Job Retries**                                    | `1`                              |
| **Job Execution Timeout**                          | `300 seconds`                    |
| **Overall Timeout**                                | `300 seconds`                    |
| **Authentication / Service Account Impersonation** | `None`                           |
| **Connection Status**                              | ✅ **OK**                         |



---

### profiles.yml

```text

(.venv) venkatramireddy@Venkatramis-MacBook-Pro gcp-hospital-medallion % cat ~/.dbt/profiles.yml
gcp_alshaya_dbt:
  outputs:
    dev:
      dataset: dbt_dev
      job_execution_timeout_seconds: 300
      job_retries: 1
      location: asia-south1
      method: oauth
      priority: interactive
      project: project-5fbc8bf7-2dd6-4f0a-a5f
      threads: 4
      type: bigquery
  target: dev
gcp_hospital_medallion:
  outputs:
    dev:
      dataset: hospital_silver
      job_execution_timeout_seconds: 300
      job_retries: 1
      location: asia-south1
      method: oauth
      priority: interactive
      project: project-5fbc8bf7-2dd6-4f0a-a5f
      threads: 4
      type: bigquery
  target: dev
```


### `profiles.yml` Configuration

| Profile                  | Target | Dataset           | Project                          | Location      | Method  | Priority      | Threads | Job Timeout (sec) | Retries | Type       |
| ------------------------ | ------ | ----------------- | -------------------------------- | ------------- | ------- | ------------- | ------: | ----------------: | ------: | ---------- |
| `gcp_alshaya_dbt`        | `dev`  | `dbt_dev`         | `project-5fbc8bf7-2dd6-4f0a-a5f` | `asia-south1` | `oauth` | `interactive` |       4 |               300 |       1 | `bigquery` |
| `gcp_hospital_medallion` | `dev`  | `hospital_silver` | `project-5fbc8bf7-2dd6-4f0a-a5f` | `asia-south1` | `oauth` | `interactive` |       4 |               300 |       1 | `bigquery` |

### Active dbt Configuration

| Setting                | Value                            |
| ---------------------- | -------------------------------- |
| **Active Profile**     | `gcp_hospital_medallion`         |
| **Target**             | `dev`                            |
| **Dataset**            | `hospital_silver`                |
| **GCP Project**        | `project-5fbc8bf7-2dd6-4f0a-a5f` |
| **Region**             | `asia-south1`                    |
| **Authentication**     | OAuth                            |
| **Execution Priority** | Interactive                      |
| **Threads**            | 4                                |
| **Job Timeout**        | 300 seconds                      |
| **Job Retries**        | 1                                |
| **Warehouse**          | BigQuery                         |


---

## 1. Project

```bash
cd \~/Documents/gcp/gcp-hospital-medallion
pwd
ls -la
git status
```

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
pip show \<package>
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
gcloud storage buckets create \\
gs://gcp-hospital-medallion-data \\
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
bq mk --dataset \\
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_bronze

bq mk --dataset \\
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_silver

bq mk --dataset \\
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_gold
```

## 7. BigQuery Schema

Show table schema:

```bash
bq show --schema --format=prettyjson \\
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_bronze.registrations
```

## 8. BigQuery Queries

Basic query:

```bash
bq query --use_legacy_sql=false '
SELECT \*
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_bronze.registrations`
LIMIT 10
'
```

Count rows:

```bash
bq query --use_legacy_sql=false '
SELECT COUNT(\*) AS row_count
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_bronze.registrations`
'
```

Count + watermark:

```bash
bq query --use_legacy_sql=false '
SELECT
    COUNT(\*) AS row_count,
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
\~/.dbt/profiles.yml

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
dbt seed --select \<seed_name>
```

## 15. dbt Snapshots

Run snapshots:

```bash
dbt snapshot
```

Check snapshot:

```bash
bq query --use_legacy_sql=false '
SELECT \*
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
    COUNT(\*) AS row_count,
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


## 27. dbt Model Selection

### Select One Model

Preview:

```bash
dbt ls --select stg_registrations
```

Run:

```bash
dbt run --select stg_registrations
```

Build model + tests:

```bash
dbt build --select stg_registrations
```

### Select Multiple Models

Preview:

```bash
dbt ls --select stg_registrations stg_encounters
```

Run:

```bash
dbt run --select stg_registrations stg_encounters
```

Build:

```bash
dbt build --select stg_registrations stg_encounters
```

### Select Downstream Models

Model + everything downstream:

```bash
dbt ls --select stg_registrations+
```

Run:

```bash
dbt run --select stg_registrations+
```

Build:

```bash
dbt build --select stg_registrations+
```

### Select Upstream Models

Everything upstream + selected model:

```bash
dbt ls --select +stg_registrations
```

### Select Both Upstream and Downstream

Everything upstream + model + everything downstream:

```bash
dbt ls --select +stg_registrations+
```

### Directory Selection

Select all models under Silver:

```bash
dbt ls --select path:models/silver
```

Select all models under Gold:

```bash
dbt ls --select path:models/gold
```

Run all Silver models:

```bash
dbt run --select path:models/silver
```

Run all Gold models:

```bash
dbt run --select path:models/gold
```

Silver + downstream models:

```bash
dbt ls --select path:models/silver+
```

### Tags

Select resources with Silver tag:

```bash
dbt ls --select tag:silver
```

Select only models with Silver tag:

```bash
dbt ls --select tag:silver --resource-type model
```

Select Gold:

```bash
dbt ls --select tag:gold
```

Run Silver:

```bash
dbt run --select tag:silver
```

Build Silver + tests:

```bash
dbt build --select tag:silver
```

### Tag Configuration

Example in `dbt_project.yml`:

```yaml
models:
  gcp_hospital_medallion:

    silver:
      +tags:
        - silver

    gold:
      +tags:
        - gold
```

### Combining Selectors

Select Silver + Gold:

```bash
dbt ls --select tag:silver tag:gold
```

Select Silver + downstream:

```bash
dbt ls --select tag:silver+
```

Select multiple models + downstream:

```bash
dbt ls --select stg_registrations+ stg_encounters+
```

### Excluding Models

Select Silver but exclude `stg_doctors`:

```bash
dbt build \\
  --select tag:silver \\
  --exclude stg_doctors
```

### Selector Mental Model

```text
\<model>+       = model + downstream
+\<model>       = upstream + model
+\<model>+      = upstream + model + downstream

path:\<path>    = select by directory
tag:\<tag>      = select by tag
--exclude      = remove from selection
```

### Recommended Practice

Preview selection first:

```bash
dbt ls --select \<selector>
```

Run selected models:

```bash
dbt run --select \<selector>
```

Build selected models + tests:

```bash
dbt build --select \<selector>
```

## 28. dbt Documentation

### Generate Documentation

```bash
dbt docs generate
```

### Serve Documentation Locally

```bash
dbt docs serve
```

### Typical Workflow

```bash
dbt build
dbt docs generate
dbt docs serve
```

### Documentation Files

```text
models/schema.yml
```

Contains model and column descriptions, tests, and metadata.

### Important dbt Documentation Concepts

```text
description
    -> Model / column documentation

source()
    -> Source lineage

ref()
    -> Model dependency + lineage

data_tests
    -> Test metadata

dbt docs
    -> Browsable documentation + lineage
```

### Documentation Structure

```text
Bronze Source
     |
     v
Silver Model
     |
     v
Gold Model
     |
     v
Tests / Metadata
```

> Next we'll do **\*\*docs blocks\*\***, but importantly, we'll use them only where they provide value. We don't need to invent elaborate documentation for every model just to demonstrate the feature.


## 29. dbt Docs Blocks

### What Is a Docs Block?

A docs block allows richer, reusable documentation to be defined
in a Markdown file and referenced from dbt model or column descriptions.

Use docs blocks when documentation contains more than a short description.

Typical use cases:

```text
Business definitions
Complex transformation rules
Important data concepts
Detailed explanations
Known limitations
```

### Create a Docs Block

Docs blocks can be stored in a Markdown file, for example:

```text
models/docs/business_definitions.md
```

Example:

```markdown
{% docs registration_definition %}

A registration represents the initial registration of a patient
with the hospital.

A registration is the primary patient-level record in the
registration domain and can be associated with multiple
encounters, admissions, discharges, and billing records.

The registration record contains the patient's identifying
information, registration date, status, and audit timestamps.

{% enddocs %}
```

The identifier is:

```text
registration_definition
```

### Reference a Docs Block

In `models/schema.yml`:

```yaml
- name: stg_registrations
  description: "{{ doc('registration_definition') }}"
```

This replaces a simple model description such as:

```yaml
description: "Silver registration records."
```

### Docs Block Flow

```text
business_definitions.md
        |
        v
registration_definition
        |
        v
models/schema.yml
        |
        v
stg_registrations
        |
        v
dbt Docs
```

### Model-Level Docs Block

For our project, we used the docs block for the
registration model as a whole:

```yaml
- name: stg_registrations
  description: "{{ doc('registration_definition') }}"
```

Column descriptions remain in `schema.yml`:

```yaml
columns:
  - name: registration_id
    description: "Unique registration identifier."
```

### Simple Description vs Docs Block

Use a normal description for short documentation:

```yaml
description: "Unique registration identifier."
```

Use a docs block for richer business documentation:

```yaml
description: "{{ doc('registration_definition') }}"
```

### When to Use Docs Blocks

Use docs blocks when:

```text
The documentation is detailed
The definition is business-oriented
The same documentation needs to be reused
The explanation is too large for a simple YAML description
```

Do not create docs blocks just for the sake of using the feature.

For simple model or column descriptions, normal YAML
descriptions are sufficient.

### Validate Docs Block Changes

Parse the project:

```bash
dbt parse
```

Generate documentation:

```bash
dbt docs generate
```

Serve documentation locally:

```bash
dbt docs serve
```

Open:

```text
http://localhost:8080
```

### Important

`dbt parse` validates that the docs block and its reference
are understood by dbt.

`dbt docs generate` regenerates the documentation artifacts.

`dbt docs serve` serves the generated documentation locally.

If port 8080 is already being used, check:

```bash
lsof -i :8080
```

If an existing dbt docs server is already running, refresh:

```text
http://localhost:8080
```

instead of starting another server.


> This captures the **\*\*actual thing we implemented with `stg_registrations`\*\***, including the `localhost:8080` issue we encountered, rather than just documenting the syntax.


## 30. dbt Model Contracts

### Check Model Schema

```bash
bq show --schema --format=prettyjson \\
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_silver.stg_registrations
```

### Enforce a Contract

In `models/schema.yml`:

```yaml
config:
  contract:
    enforced: true
  on_schema_change: fail
```

### Define Column Data Types

Example:

```yaml
columns:
  - name: registration_id
    data_type: string

  - name: date_of_birth
    data_type: date

  - name: registration_date
    data_type: timestamp
```

### Validate Contract Configuration

```bash
dbt parse
```

### Build Contracted Model

```bash
dbt build --select stg_registrations
```

### Build Model + Downstream Models

```bash
dbt build --select stg_registrations+
```

### Contract vs Data Tests

```text
Model Contract
    -> Protects model schema
    -> Expected columns
    -> Expected data types
    -> Schema/interface changes

Data Tests
    -> Protect data quality
    -> not_null
    -> unique
    -> relationships
    -> accepted_values
    -> Custom business rules
```

### Contract Failure

A contract can fail when:

```text
Expected column is missing
Column data type is incorrect
Model schema does not match the declared contract
```

### Incremental Models + Contracts

For an incremental model with an enforced contract:

```yaml
config:
  contract:
    enforced: true
  on_schema_change: fail
```

Allowed `on_schema_change` values with enforced incremental contracts:

```text
append_new_columns
fail
```

For this project we use:

```yaml
on_schema_change: fail
```

because unexpected schema changes should stop the pipeline for review.

### DAG Protection

```text
stg_registrations
       |
       X  Contract failure
       |
       v
patient_360
       |
      SKIP
```

A failed upstream model should not allow dependent models to consume
the failed model.

### Current Project Decision

Contract currently implemented only on:

```text
stg_registrations
```

Do not add contracts to all models just for consistency.

Add them later only where schema/interface protection provides
real value.


### Current state

So far your practical dbt setup now covers:

```text
Sources
    ↓
Silver models
    ↓
Incremental models
    ↓
Snapshots
    ↓
Data quality tests
    ↓
Custom tests
    ↓
Severity / thresholds
    ↓
dbt build
    ↓
Model selection
    ↓
Tags
    ↓
Documentation
    ↓
Docs blocks
    ↓
Model contracts
```

> That's a pretty solid foundation. \*\*Next we should move to another practical dbt topic rather than adding more contract examples.\*\*




## 31. dbt Exposures

### List Exposures

```bash
dbt ls --resource-type exposure
```

### Concept

```text
Gold Model
    ↓
Exposure
    ↓
Dashboard / Analytics / Business Consumer
```

### Example Exposure

```yaml
exposures:

  - name: hospital_patient_360_dashboard
    label: Hospital Patient 360 Dashboard
    type: dashboard
    maturity: medium
    description: "Patient-level hospital analytics dashboard."

    depends_on:
      - ref('patient_360')

    owner:
      name: Data Analytics Team
      email: analytics@example.com
```

### Project Decision

No exposure added yet because the project does not currently have an
actual reporting/dashboard consumer to document.

Add exposures when real business-facing consumers exist.

## 32. dbt Snapshots

### List Snapshots

```bash
dbt ls --resource-type snapshot
```

### Run Snapshots

```bash
dbt snapshot
```

### Check Snapshot Schema

```bash
bq show --schema --format=prettyjson \\
project-5fbc8bf7-2dd6-4f0a-a5f:hospital_silver.doctors_snapshot
```

### Query Snapshot History

```bash
bq query --use_legacy_sql=false '
SELECT \*
FROM `project-5fbc8bf7-2dd6-4f0a-a5f.hospital_silver.doctors_snapshot`
ORDER BY doctor_id, dbt_valid_from
'
```

### Snapshot Strategy

```text
timestamp
    → Detect changes using updated_at

check
    → Detect changes by comparing selected columns
```

### Existing Project Snapshot

```text
Snapshot:
    doctors_snapshot

unique_key:
    doctor_id

strategy:
    check

check_cols:
    doctor_name
    specialization_id
    specialization_name
    status
```

### Snapshot Configuration

```sql
{{
    config(
        target_schema='hospital_silver',
        unique_key='doctor_id',
        strategy='check',
        check_cols=[
            'doctor_name',
            'specialization_id',
            'specialization_name',
            'status'
        ]
    )
}}
```

### Important Snapshot Columns

```text
dbt_scd_id
dbt_updated_at
dbt_valid_from
dbt_valid_to
```

### Historical Version Concept

```text
doctor_id | status   | dbt_valid_from | dbt_valid_to
----------|----------|----------------|-------------
DOC001    | Active   | Aug 01         | Aug 15
DOC001    | Inactive | Aug 15         | NULL
```

NULL dbt_valid_to means the current active version.

### Incremental vs Snapshot

```text
Incremental
    → Efficiently process new/changed records
    → Usually represents current state

Snapshot
    → Preserve historical versions
    → Supports historical/SCD-style analysis
```

### Project Decision

Existing doctors_snapshot is sufficient for the project.

No snapshot redesign required currently.

## 33. dbt Macros and Jinja

### Compile a Model

```bash
dbt compile --select stg_registrations
```

### Parse Project

```bash
dbt parse
```

### Basic Jinja Expression

```sql
{{ ref('stg_registrations') }}
```

```sql
{{ source('hospital_bronze', 'registrations') }}
```

### Jinja Output vs Logic

```text
{{ ... }}
    → Evaluate/output a value

{% ... %}
    → Execute Jinja logic
```

### Define a Macro

```sql
{% macro clean_string(column_name) %}
    NULLIF(TRIM(UPPER({{ column_name }})), '')
{% endmacro %}
```

### Call a Macro

```sql
{{ clean_string('city') }}
```

### Expected Compiled SQL

```sql
NULLIF(TRIM(UPPER(city)), '')
```

### Macro Flow

```text
Macro
    ↓
Jinja invocation
    ↓
dbt compile
    ↓
Compiled SQL
    ↓
BigQuery
```

### Jinja Conditional

```sql
{% if condition %}

{% else %}

{% endif %}
```

### Jinja Loop

```sql
{% for column in columns %}
    {{ column }}
{% endfor %}
```

### Macro with Arguments

```sql
{% macro clean_string(column_name, convert_upper=true) %}

    {% if convert_upper %}
        NULLIF(TRIM(UPPER({{ column_name }})), '')
    {% else %}
        NULLIF(TRIM({{ column_name }}), '')
    {% endif %}

{% endmacro %}
```

### Macro Guidelines

Use macros for:

```text
Repeated logic
Reusable transformations
Reusable business logic
Reusable test logic
```

Avoid macros for:

```text
One-off simple SQL
Trivial expressions
Logic that becomes harder to understand than normal SQL
```

### Project Macro

```text
macros/string_utils.sql
```

Current demonstration macro:

```text
clean_string()
```

## 34. dbt Variables and Jinja Configuration

### Define a Variable

In dbt_project.yml:

```yaml
vars:
  hospital_country: "India"
```

### Read a Variable

```sql
{{ var('hospital_country') }}
```

### Variable with Default

```sql
{{ var('hospital_country', 'India') }}
```

### Pass Variable from Command Line

```bash
dbt build --vars '{"hospital_country": "India"}'
```

### Variable Containing a List

```yaml
vars:
  doctors_snapshot_check_cols:
    - doctor_name
    - specialization_id
    - specialization_name
    - status
```

Can be referenced as:

```jinja
var('doctors_snapshot_check_cols')
```

Example snapshot usage:

```sql
check_cols=var('doctors_snapshot_check_cols')
```

### Variable vs Environment Variable

```text
var()
    → dbt project/runtime variable

env_var()
    → Operating-system/environment variable
```

### Good Uses for Variables

```text
Environment configuration
Incremental lookback window
Business configuration
Thresholds
Feature flags
Runtime configuration
```

Avoid using variables for individual data records.

### Snapshot Check Columns

`var()` can hold a Python/YAML-style list and can technically be used
for snapshot check_cols.

However, keep business-defining snapshot columns directly in the
snapshot unless there is a real configuration requirement.

Explicit:

```sql
check_cols=[
    'doctor_name',
    'specialization_id',
    'specialization_name',
    'status'
]
```

is easier to understand and maintain.

### Project Decision

No change to doctors_snapshot.

Keep its check_cols explicitly defined.

## 35. Staging vs Intermediate vs Gold

### Current Project Architecture

```text
Bronze
    ↓
Silver
    ↓
Gold
```

Current models:

```text
Silver
    stg_registrations
    stg_encounters
    stg_admissions
    stg_discharges
    stg_billing
    stg_doctors
    stg_departments

Gold
    patient_360
    encounter_summary
    billing_summary
```

### Typical Larger dbt Architecture

```text
Source
    ↓
Staging
    ↓
Intermediate
    ↓
Marts / Gold
```

### Staging Purpose

```text
Close to source
Rename columns
Cast data types
Standardize values
Basic cleanup
Basic transformations
```

### Intermediate Purpose

```text
Complex transformations
Reusable business logic
Combining multiple staging models
Logic shared by multiple Gold models
```

### Gold / Marts Purpose

```text
Business-facing models
Analytics
Reporting
KPIs
Consumer-oriented datasets
```

### When to Add Intermediate Models

Add an intermediate model when logic becomes:

```text
Complex
Reusable
Repeated
Difficult to maintain inside a Gold model
```

### Project Decision

Do not add an intermediate layer yet.

Current:

```text
Bronze
    ↓
Silver
    ↓
Gold
```

is sufficient for the current project size.

Architecture should follow actual complexity rather than adding layers
only to make the project look more enterprise.

## 36. dbt Packages

### Package Definition

Packages provide reusable:

```text
Macros
Tests
Models
Utilities
```

### Package Configuration File

```text
packages.yml
```

### Example dbt_utils Package

```yaml
packages:
  - package: dbt-labs/dbt_utils
    version: [">=1.0.0", "<2.0.0"]
```

### Install Packages

```bash
dbt deps
```

### Validate Package Installation

```bash
dbt parse
```

### Check Installed Package

```bash
ls -ld dbt_packages/dbt_utils
```

### Check Package Lock

```bash
cat package-lock.yml
```

### List Tests

```bash
dbt ls --resource-type test
```

### Current Package

```text
dbt-labs/dbt_utils
```

### Package Usage Hierarchy

```text
Simple standard test
    ↓
Built-in dbt test

Specialized reusable test
    ↓
Trusted package such as dbt_utils

Project-specific business rule
    ↓
Custom generic/singular test
```

### dbt_utils Example

```yaml
data_tests:
  - dbt_utils.unique_combination_of_columns:
      arguments:
        combination_of_columns:
          - registration_id
          - bill_date
```

This checks that the combination of columns is unique.

### dbt_utils expression_is_true

Example:

```yaml
data_tests:
  - dbt_utils.expression_is_true:
      arguments:
        expression: "total_billed >= 0"
```

Conceptually:

```text
Every row
    ↓
Expression evaluates to TRUE
    ↓
PASS

Expression evaluates to FALSE
    ↓
FAIL
```

### Important Project Decision

Do not replace existing custom tests simply because dbt_utils provides
similar functionality.

Current custom test:

```text
updated_at_not_before_created_at
```

remains as the project-specific reusable business rule.

Use dbt_utils when it provides useful functionality that is not already
covered by an existing project test.

### Package Installation Result

Before dbt_utils:

```text
564 macros
```

After installation:

```text
681 macros
```

This confirms that the package macros are loaded into the dbt project.



## 99. dbt Learning Progress

### Completed

- [x] Python / virtual environment
- [x] GCP CLI
- [x] GCP authentication
- [x] GCP project configuration
- [x] GCP APIs
- [x] GCS
- [x] BigQuery
- [x] dbt Core
- [x] dbt BigQuery adapter
- [x] profiles.yml
- [x] dbt sources
- [x] dbt models
- [x] Materializations
- [x] Seeds
- [x] Snapshots
- [x] Incremental models
- [x] Generic tests
- [x] Singular tests
- [x] Custom generic tests
- [x] Test severity
- [x] warn_if / error_if
- [x] dbt build
- [x] DQ failure / downstream SKIP
- [x] dbt model selection
- [x] dbt Documentation
- [x] dbt Docs Blocks
- [x] dbt Model Contracts
- [x] dbt Exposures
- [x] dbt Macros / Jinja
- [x] dbt Variables
- [x] Staging vs Intermediate vs Gold
- [x] dbt Packages
- [x] dbt_utils
- [x] Project-specific custom business-rule tests

### Missing / To Be Covered

- [ ] Source freshness
- [ ] dbt unit tests
- [ ] Hooks and operations
- [ ] Seeds: configuration, column types, and incremental/controlled seed workflows
- [ ] Advanced incremental strategies and `is_incremental()`
- [ ] Incremental model performance and partitioning
- [ ] BigQuery partitioning and clustering in dbt
- [ ] Model `access` configuration and model groups
- [ ] Model `meta` configuration
- [ ] Advanced selectors and `selectors.yml`
- [ ] State-aware selection
- [ ] `--state` and `--defer`
- [ ] dbt artifacts: `manifest.json`, `run_results.json`, and `catalog.json`
- [ ] Source / model lineage troubleshooting
- [ ] `ref()` dependency behavior and DAG troubleshooting
- [ ] Advanced testing patterns with `dbt_utils`
- [ ] Test configuration and reusable test arguments
- [ ] Test performance and large-table testing considerations
- [ ] Documentation configuration and richer column-level documentation
- [ ] Exposures: practical dashboard/consumer implementation
- [ ] dbt `analyses/`
- [ ] Custom materializations
- [ ] Dispatch and adapter-specific macros
- [ ] Environment variables with `env_var()`
- [ ] Target-specific configuration using `target`
- [ ] Multiple dbt targets / dev vs prod configuration
- [ ] CI/CD workflow for dbt
- [ ] dbt job execution / scheduling
- [ ] Production deployment considerations
- [ ] Logging, run results, and failure investigation
- [ ] Retry / recovery strategies
- [ ] Cost optimization for BigQuery + dbt
- [ ] Performance optimization for dbt DAGs
- [ ] Full production-style dbt project workflow

### Recommended Next Topics

1. Source freshness
2. dbt unit tests
3. Advanced incremental models
4. BigQuery partitioning and clustering
5. Hooks and operations
6. `selectors.yml`, state selection, `--state`, and `--defer`
7. dbt artifacts and production troubleshooting
8. CI/CD and production deployment
9. Cost and performance optimization
10. Full production-style dbt workflow