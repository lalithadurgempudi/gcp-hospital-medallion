SELECT * FROM {{ source('hospital_bronze', 'departments') }}
