with source as(
    select * from {{ source('northwind', 'order_details') }}
)
select *,
current_timestamp() as insertion_timestamp
from source