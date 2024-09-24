with source as(
    select * from {{ source('northwind', 'orders_status') }}
)
select *,
current_timestamp() as insertion_timestamp
from source