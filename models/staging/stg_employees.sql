with source as(
    select * from {{ source('northwind', 'employees') }}
)
select *,
current_timestamp() as insertion_timestamp
from source