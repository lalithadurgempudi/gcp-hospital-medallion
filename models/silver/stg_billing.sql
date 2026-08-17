SELECT * FROM {{ source('hospital_bronze', 'billing') }}
