with source as(
    select * from {{ source('northwind', 'purchase_order_details') }}
)
select *,
current_timestamp() as insertion_timestamp
from source