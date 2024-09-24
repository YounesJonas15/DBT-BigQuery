with source as(
    select * from {{ source('northwind', 'orders') }}
)
select *,
current_timestamp() as insertion_timestamp
from source