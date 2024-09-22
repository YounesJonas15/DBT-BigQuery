with source as(
    select * from {{ source('northwind', 'invoices') }}
)
select *,
current_timestamp() as insertion_timestamp
from source