with source as(
    select * from {{ source('northwind', 'shippers') }}
)
select *,
current_timestamp() as insertion_timestamp
from source