SELECT * FROM {{ source('hospital_bronze', 'doctors') }}
