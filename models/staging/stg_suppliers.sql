with source as(
    select * from {{ source('northwind', 'suppliers') }}
)
select *,
current_timestamp() as insertion_timestamp
from source