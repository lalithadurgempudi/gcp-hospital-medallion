SELECT * FROM {{ source('hospital_bronze', 'discharges') }}
