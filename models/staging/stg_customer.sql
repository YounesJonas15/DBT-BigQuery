with source as(
    select * from {{ source('northwind', 'customer') }}
)
select *,
current_timestamp() as insertion_timestamp
from source