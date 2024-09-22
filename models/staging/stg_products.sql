with source as(
    select * from {{ source('northwind', 'products') }}
)
select *,
current_timestamp() as insertion_timestamp
from source