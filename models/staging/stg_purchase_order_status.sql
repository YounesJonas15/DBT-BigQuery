with source as(
    select * from {{ source('northwind', 'purchase_order_status') }}
)
select *,
current_timestamp() as insertion_timestamp
from source