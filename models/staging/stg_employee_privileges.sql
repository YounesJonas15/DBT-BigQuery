with source as(
    select * from {{ source('northwind', 'employee_privileges') }}
)
select *,
current_timestamp() as insertion_timestamp
from source