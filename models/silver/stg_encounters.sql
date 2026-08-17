SELECT * FROM {{ source('hospital_bronze', 'encounters') }}
