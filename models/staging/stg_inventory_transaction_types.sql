with source as(
    select * from {{ source('northwind', 'inventory_transaction_types') }}
)
select *,
current_timestamp() as insertion_timestamp
from source