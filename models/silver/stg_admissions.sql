SELECT * FROM {{ source('hospital_bronze', 'admissions') }}
