with source as(
    select * from {{ source('northwind', 'inventory_transactions') }}
)
select *,
current_timestamp() as insertion_timestamp
from source